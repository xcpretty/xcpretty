module XCPretty
  class JSONCompilationDatabase

    include XCPretty::FormatMethods
    FILE_PATH = 'build/reports/compilation_db.json'

    def load_dependencies
      unless @@loaded ||= false
        require 'fileutils'
        require 'pathname'
        unless Object.const_defined?(:JSON)
          begin
            require 'json'
          rescue LoadError
            require File.expand_path(File.join(File.dirname(__FILE__), '../../../vendor/json_pure/generator'))
          end
        end
        @@loaded = true
      end
    end

    def initialize(options)
      load_dependencies
      @file_path = options[:path] || FILE_PATH
      @parser = Parser.new(self)
      @compilation_units = []
      @pch_path = nil
      @current_file = nil
      @current_path = nil
    end

    def handle(line)
      @parser.parse(line)
    end

    def format_process_pch_command(file_path)
      @pch_path = file_path
    end

    def format_compile(file_name, file_path)
      @current_file = file_name
      @current_path = file_path
    end

    def format_compile_command(compiler_command, file_path)
      directory = file_path.gsub("#{@current_path}", '').gsub(/\/$/, '')
      directory = '/' if directory.empty?
      @compilation_units << {:command => compiler_command.gsub(/(\-include)\s.*\.pch/, "\\1 #{@pch_path}"),
                             :file => @current_path,
                             :directory => directory}
    end

    def finish
      FileUtils.mkdir_p(File.dirname(@file_path))
      write_report
    end

    private

    def write_report
      File.open(@file_path, 'w') do |f|
        f.write(@compilation_units.to_json)
      end
    end
  end
end
