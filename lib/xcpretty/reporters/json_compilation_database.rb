module XCPretty
  class JSONCompilationDatabase < Reporter

    FILEPATH = 'build/reports/compilation_db.json'

    def load_dependencies
      unless @@loaded ||= false
        require 'fileutils'
        require 'pathname'
        require 'json'
        @@loaded = true
      end
    end

    def initialize(options)
      super(options)
      @compilation_units = []
      @pch_path = nil
      @current_file = nil
      @current_path = nil
      @cd_path = nil
      @all_pch_list = []
    end

    def format_process_pch_command(file_path)
      @pch_path = file_path
      # Processing relative path in pch command
      cd_path_list = @cd_path.split('/')
      pch_path_list = @pch_path.split(" ")
      # Replace relative path with absolute path in pch command
      tmp_pch_path_list = []
      for pch_path_list_one in pch_path_list
        if pch_path_list_one.index(/\.\./)
          cd_path_list_length = cd_path_list.length
          tmp_path_list = cd_path_list[0, cd_path_list_length-1]
          tmp_path = tmp_path_list.join("/")
          tmp_path = tmp_path + "/"
          pch_path_list_one = pch_path_list_one.sub(/([^\/])\.\.\//, "\\1#{tmp_path}")
          if pch_path_list_one.start_with?("\.\.")
            pch_path_list_one = pch_path_list_one.sub(/\.\.\//, "#{tmp_path}")
          end
        end
        if pch_path_list_one.index(/-[I|F][a-z|A-Z]/)
          tmp_path = @cd_path
          tmp_path = tmp_path + "/"
          pch_path_list_one.insert(2, tmp_path)
        end
        tmp_pch_path_list.push(pch_path_list_one)
      end
      # @pch_path = pch_path_list.join(" ")
      @pch_path = tmp_pch_path_list.join(" ")
      # Get pch_list
      if file_path
        @all_pch_list.push(@pch_path)
      end
    end

    def format_compile(file_name, file_path)
      @current_file = file_name
      @current_path = file_path
    end

    # obtain cd path
    def format_shell_command(command, arguments)
      if command.index("cd")
        @cd_command = command
        @cd_path = arguments
      end
    end

    def format_compile_command(compiler_command, file_path)
      directory = file_path.gsub("#{@current_path}", '').gsub(/\/$/, '')
      directory = '/' if directory.empty?
      cmd = compiler_command

      # Replace relative path with absolute path in command
      cd_path_list = @cd_path.split('/')
      cmd_list = cmd.split(" ")
      tmp_cmd_list = []
      for cmd_list_one in cmd_list
        if cmd_list_one.index("\.\.")
          # process the situation of (-I../ et al.)
          cd_path_list_length = cd_path_list.length
          tmp_path_list = cd_path_list[0, cd_path_list_length-1]
          tmp_path = tmp_path_list.join("/")
          tmp_path = tmp_path + "/"
          cmd_list_one = cmd_list_one.sub(/([^\/])\.\.\//, "\\1#{tmp_path}")
          # process the situation of (-iqoute ../)
          if cmd_list_one.start_with?("\.\.")
            cmd_list_one = cmd_list_one.sub(/\.\.\//, "#{tmp_path}")
          end
        end
        # Dealing with the relative path problem of subproject
        if cmd_list_one.index(/-[I|F][a-z|A-Z]/)
          tmp_path = @cd_path
          tmp_path = tmp_path + "/"
          cmd_list_one.insert(2, tmp_path)
        end
        tmp_cmd_list.push(cmd_list_one)
      end
      cmd = tmp_cmd_list.join(" ")

      # @pch_path replacement chaos problem
      cmd.gsub(/\-include\s(.*\.pch)/, "\$1")
      tmp_pch_path = $1
      i = @all_pch_list.length - 1
      while i >= 0 do
        if @all_pch_list.at(i) and tmp_pch_path
          if @all_pch_list.at(i).include? tmp_pch_path
            cmd = cmd.gsub(/(\-include)\s.*\.pch/, "\\1 #{@all_pch_list.at(i)}") if @all_pch_list.at(i)
          end
        end
        i = i - 1
      end
      @compilation_units << {command: cmd,
                             file: @current_path,
                             directory: directory}
    end

    def write_report
      File.open(@filepath, 'w') do |f|
        f.write(@compilation_units.to_json)
      end
    end
  end
end

