module XCPretty
  class Syntax

    OBJC = 'objc'
    OBJC_EXTENSIONS = ['.m','.h']

    SWIFT = 'swift'
    SWIFT_EXTENSIONS = ['.swift']

    DYLAN = 'dylan'
    DYLAN_EXTENSIONS = ['.dyl','.dylan']

    RUBY = 'ruby'
    RUBY_EXTENSIONS = ['.ruby','.rb']

    def self.highlight(snippet, options="")
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
      case File.extname(filename)
      when *OBJC_EXTENSIONS
        OBJC
      when *SWIFT_EXTENSIONS
        SWIFT
      when *DYLAN_EXTENSIONS
        DYLAN
      when *RUBY_EXTENSIONS
        RUBY
      else
        OBJC
      end
    end
  end
end
