require 'xcpretty/snippet'

module XCPretty
  class Syntax

    def self.register_filetype(type, extensions)
      @filetypes ||= {}
      extensions.each { |ext| @filetypes[ext] = type }
    end

    register_filetype 'c++',    ['.cpp', '.hpp', '.c++', '.cxx', '.cc']
    register_filetype 'objc',   ['.m', '.h']
    register_filetype 'objc++', ['.mm', '.hh']
    register_filetype 'swift',  ['.swift']
    register_filetype 'dylan',  ['.dyl', '.dylan']
    register_filetype 'ruby',   ['.ruby', '.rb']

    def self.highlight(snippet, options = '')
      if pygments_available?
        language = file_language(File.basename(snippet.file_path))
        pygmentize(snippet.contents, options, language)
      else
        snippet.contents
      end
    end

    private

    def self.pygments_available?
      @available = system('which pygmentize > /dev/null') if @available.nil?
      @available
    end

    def self.pygmentize(code, options, language)
      `echo '#{code}' | pygmentize -f 256 -l #{language} #{options}`
    end

    def self.file_language(filename)
      ext = File.extname(filename)
      @filetypes[ext] || 'objc'
    end

  end
end

