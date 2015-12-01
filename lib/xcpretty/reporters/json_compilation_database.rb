module XCPretty
  class JSONCompilationDatabase

    include XCPretty::FormatMethods
    FILE_PATH = 'build/reports/compilation_db.json'

    def load_dependencies
      unless @@loaded ||= false
        require 'fileutils'
        require 'pathname'
        require 'json'
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

      cmd = compiler_command
      cmd = compiler_command.gsub(/(\-include)\s.*\.pch/, "\\1 #{@pch_path}") if @pch_path

      @compilation_units << {command: cmd,
                             file: @current_path,
                             directory: directory}
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

