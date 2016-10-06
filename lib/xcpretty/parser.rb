require 'pathname'
module XCPretty
module Log
  def self.debug(*args)
    if ENV["XCPRETTY_DEBUG"]
      puts "DEBUG: #{args}"
    end
  end
end

# Chunk represents a segment of xcodebuild's output, usually # grouped by the
# task (e.g. Compile, Analyze, ...).
class Chunk
  def initialize(name, &block)
    @name = name
    @line_handlers = []
    @exit = /^\n/
    block.call(self)
  end

  def line(regex, &block)
    @line_handlers << [regex, (block if block_given?)]
  end

  def exit(regex)
    @exit = regex
  end

  # Used for faster iteration and finding the responsible chunk.
  # Goes only over entry points insted of trying every regex for a chunk.
  # Parses and registers itself as responsible chunk when done.
  def enter(line, formatter)
    entry_regex, handler = @line_handlers.first
    if match = line.match(entry_regex)
      Log.debug "Entered #{line}"
      handler.call(formatter, match)
      return self
    end
  end

  # Handles a given line from the parser, and tries to recognize it.  If the
  # line was recognized, it will either be printed (block given) or ignored (no
  # block given).  If the line was not recognized, it will be printed as it is.
  def handle(line, formatter)
    @line_handlers.each do |handler|
      matches = line.match(handler.first)
      if matches
        Log.debug "Handling #{line}"
        handler[1].call(formatter, matches) if handler[1]
        return self
      end
    end
    if line.match(@exit)
      Log.debug("Exiting")
      return nil
    end

    formatter.format_unknown(line.chomp)
    return self
  end
end

class Parser
  @@chunks = []
  attr_reader :formatter

  def initialize(formatter)
    @formatter = formatter
    @chunks = []
  end

  # Parses a line of a log file.
  #
  # It asks the current chunk to process line, or if there's no chunk, it finds
  # the responsible one. If no responsible chunk is found, it'll just print out
  # the line and move on.
  #
  # If there was a responsible chunk, it'll try to recognize the line and
  # format it. If the line wasn't recognized by a chunk it'll just print it
  # out and keep waiting for it's own input.
  #
  # When a chunk sees it's end (empty newline by default), it de-registers
  # itself and parser tries to find a new one for the next line.
  def parse(line)
    if @current_chunk
      @current_chunk = @current_chunk.handle(line, @formatter)
    else
      @@chunks.each do |chunk|
        @current_chunk = chunk.enter(line, @formatter)
        return if @current_chunk
      end
      # Nobody recognizes this
      formatter.format_unknown(line.chomp)
    end
  end

  def self.add(name, &block)
    @@chunks << Chunk.new(name, &block)
  end
end

def self.chunk(name, &block)
  Parser.add(name, &block)
end

def self.path(string)
  Pathname.new(string.delete('\\'))
end

# PATH is a generic path matcher. It needs to end wither with / in case of a
# directory match, or a word character in case of a file (or directory without
# a trailing slash).
PATH              = /(?:[\w\/:\-+.@]|\\ |\\&)+[\w\/]/

# Some outputs include unescaped paths (like SwiftC). Unfortunately, PATH won't
# match them, so we're forced to use something like this.
#
# Caution: when using, make sure you end the path if possible with known
# extensions or patterns. For example, a SwiftC command will end in .swift
UNESCAPED_PATH    = /[ \w\/:\-+.@&\\]+[\w\/]/

# WORD is used mostly for configuration options
WORD              = /[\w]+/
CLANG             = /^\s{4}(?:#{PATH})\/usr\/bin\/(?:clang|clang\+\+)/
SWIFT             = /^\s{4}(?:#{PATH})\/usr\/bin\/swift/
SWIFTC            = /^\s{4}(?:#{PATH})\/usr\/bin\/swiftc/
SHELL_BUILTIN     = /^\s{4}builtin-/
SHELL_CD          = /^\s{4}cd\s(#{PATH})$/
SHELL_EXPORT      = /^\s{4}export \w+=.*$/
SHELL_SETENV      = /^\s{4}setenv (?:#{WORD}) (?:#{PATH})?[\w\-]+\s(.*)$/
SHELL_SUBSHELL    = /^\s{4}\/bin\/sh -c/
SHELL_MKDIR       = /^\/bin\/mkdir -p/
SHELL_CHMOD       = /^chmod/

chunk "Compiling" do |c|
  c.line /^CompileC (?:#{PATH}\.o) (#{PATH}\.(?:m|mm|c|cc|cpp|cxx)) / do |f, m|
    f.format_compile(path(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_SETENV
  c.line SHELL_EXPORT
  c.line CLANG
end

chunk "Comp[\w]+\siling Swift" do |c|
  c.line /^CompileSwift (?:#{WORD}\s)*(#{UNESCAPED_PATH}\.swift)$/ do |f, m|
    f.format_compile(path(m[1]))
  end
  c.line SHELL_CD
  c.line SWIFT
end

chunk "Compile a pile of swift files" do |c|
  c.line /^CompileSwiftSources/ do |f|
    f.format_compile_swift_sources
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line SWIFTC
end

chunk "Merge swift modules" do |c|
  c.line /^MergeSwiftModule (?:[\w]+\s)*(#{PATH}\.swiftmodule)$/ do |f, m|
    f.format_merge_swift_module(path(m[1]))
  end
  c.line SHELL_CD
  c.line SWIFT
end

chunk "Ditto" do |c|
  c.line /^Ditto (?:#{PATH}) (#{PATH})$/ do |f,m|
    f.format_ditto(path(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line SHELL_BUILTIN
  c.line /^    \/usr\/bin\/ditto/
end

chunk "Code sign" do |c|
  c.line /^CodeSign\s(#{PATH})$/ do |f, m|
    f.format_codesign(path(m[1]))
  end
  c.line SHELL_CD
end

chunk "Write auxilliary files" do |c|
  c.line /^Write auxiliary files$/ do |f|
    f.format_write_auxiliary_files()
  end
  c.line SHELL_MKDIR
  c.line SHELL_CHMOD
  c.line /^write-file (#{PATH})$/ do |f,m|
    f.format_write_file(path(m[1]))
  end
end

chunk "Create product structure" do |c|
  c.line /^Create product structure$/ do |f|
    f.format_create_product_structure()
  end
  c.line SHELL_MKDIR
end

chunk "Check Dependencies" do |c|
  c.line /^Check dependencies$/ do |f|
    f.format_check_dependencies()
  end
end

chunk "Process info.plist" do |c|
  c.line /^ProcessInfoPlistFile (?:#{PATH}.plist) (#{PATH}.plist)$/ do |f,m|
    f.format_process_info_plist(path(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line SHELL_BUILTIN
end

chunk "PhaseScriptExecution" do |c|
  c.line /^PhaseScriptExecution\s((\\\ |\S)*)\s/ do |f,m|
    f.format_phase_script_execution(m[1].delete("\\"))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line SHELL_SUBSHELL
end

chunk "Touch" do |c|
  c.line /^Touch (#{PATH})/ do |f,m|
    f.format_touch(path(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line /^\s{4}\/usr\/bin\/touch -c/
end

chunk "Ld" do |c|
  c.line /^Ld (#{PATH}) (#{WORD})\s(#{WORD})$/ do |f,m|
    f.format_ld(path(m[1]), m[2], m[3])
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line CLANG
end

chunk "CpHeader" do |c|
  c.line /^CpHeader (#{PATH}) (#{PATH})$/ do |f,m|
    f.format_copy_header_file(path(m[1]), path(m[2]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line SHELL_BUILTIN
end

chunk "CpResource" do |c|
  c.line /^CpResource (#{PATH}) (#{PATH})$/ do |f,m|
    f.format_cpresource(path(m[1]), path(m[2]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line SHELL_BUILTIN
end

chunk "CompileXIB" do |c|
  c.line /^CompileXIB (#{PATH})/ do |f,m|
    f.format_compile_xib(path(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/ibtool /
end

chunk "Libtool" do |c|
  c.line /^Libtool (#{PATH}) (#{WORD}) (#{WORD})$/ do |f,m|
    f.format_libtool(path(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/libtool /
end

chunk "CopyPNGFile" do |c|
  c.line /^CopyPNGFile (#{PATH}) (#{PATH})/ do |f,m|
    f.format_copy_png_file(path(m[2]), path(m[1]))
  end
end

chunk "CopySwiftLibs" do |c|
  c.line /^CopySwiftLibs (#{PATH})$/ do |f,m|
    f.format_copy_swift_libs(path(m[1]))
  end
  c.line SHELL_CD
  c.line SHELL_EXPORT
  c.line /^\s{4}(?:#{PATH})\/usr\/bin\/swift-stdlib-tool /
end

end # XCPretty
