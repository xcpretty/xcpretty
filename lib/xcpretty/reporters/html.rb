module XCPretty
  class HTML

    include XCPretty::FormatMethods
    FILEPATH = 'build/reports/tests.html'

    def load_dependencies
      unless @@loaded ||= false
        require 'fileutils'
        require 'pathname'
        require 'rexml/document'
        require 'rexml/formatters/pretty'
        @@loaded = true
      end
    end

    def initialize(options)
      load_dependencies
      @filepath  = options[:path] || FILEPATH
      @directory = Dir.pwd
      @document  = REXML::Document.new
      @document << REXML::DocType.new('html')
      @document.add_element('html')
      @parser    = Parser.new(self)
    end

    def handle(line)
      @parser.parse(line)
    end

    def finish
      write_report_file
    end

    private

    def write_report_file
      FileUtils.mkdir_p(File.dirname(@filepath))
      formatter = REXML::Formatters::Pretty.new(2)
      formatter.compact = true
      formatter.write(@document, File.open(@filepath, 'w+'))
    end
  end
end