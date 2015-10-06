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
      if Pygments.available?
        language = file_language(File.basename(snippet.file_path))
        Pygments.pygmentize(snippet.contents, language, options)
      else
        snippet.contents
      end
    end

    def self.file_language(filename)
      ext = File.extname(filename)
      @filetypes[ext] || 'objc'
    end
  end

  class Pygments
    def self.pygmentize(code, language, options)
      `echo '#{code}' | pygmentize -f 256 -l #{language} #{options if options}`
    end

    def self.available?
      @available = system('which pygmentize > /dev/null') if @available.nil?
      @available
    end
  end
end

