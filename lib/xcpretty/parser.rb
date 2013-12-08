require 'shellwords'

module XCPretty

  class Parser

    def parse(text)
      case text
      when /^ProcessPCH/
        parse_pch(text)
      when /^CompileC/
        parse_compiling(text)
      when /^Clean.Remove/
        ""
      when /^Check dependencies/
        ""
      when /^=== CLEAN TARGET/
        parse_clean_target(text)
      when /^=== BUILD TARGET/
        parse_build_target(text)
      when /^PhaseScriptExecution/
        parse_run_script(text)
      when /^Libtool/
        parse_libtool(text)
      when /^CpResource/
        parse_cpresource(text)
      when /^CopyStringsFile/
        parse_copy_strings_file(text)
      when /^GenerateDSYMFile/
        parse_generating_dsym(text)
      when /^ProcessInfoPlistFile/
        parse_processing_info_plist(text)
      when /^Ld/
        parse_linking(text)
      else
        ""
      end
    end

    def parse_linking(text)
      "Linking #{text.shellsplit[1].split('/').last}"      
    end

    def parse_pch(text)
      "Precompiling " + Shellwords.shellsplit(text)[2]
    end

    def parse_processing_info_plist(text)
      "Processing #{text.lines.first.shellsplit.last.split('/').last}"
    end

    def parse_compiling(text)
      "Compiling #{text.shellsplit[2].split('/').last}"
    end

    def parse_clean_target(text)
      info = project_build_info(text)
      "Cleaning #{info[:project]}/#{info[:target]} [#{info[:configuration]}]"
    end

    def parse_build_target(text)
      info = project_build_info(text)
      "Building #{info[:project]}/#{info[:target]} [#{info[:configuration]}]"
    end

    def parse_run_script(text)
      "Running script '#{text.lines.first.shellsplit[1..-2].join(' ').gsub('\ ',' ')}'"
    end

    def parse_libtool(text)
      "Building library #{text.shellsplit[1].split('/').last}"
    end

    def parse_cpresource(text)
      "Copying #{text.shellsplit[1]}"
    end

    def parse_copy_strings_file(text)
      "Copying #{text.shellsplit.last.split('/').last}"  
    end

    def parse_generating_dsym(text)
      "Generating DSYM file"
    end

    def project_build_info(text)
      target = text.split('TARGET').last.split('OF PROJECT').first
      clean_target = target.split('-').last.strip
      project = text.split('OF PROJECT').last.split('WITH').first.strip
      configuration = text.split('CONFIGURATION').last.split('===').first.strip
      { 
        :target => clean_target, 
        :project => project, 
        :configuration => configuration
      }
    end

  end
end
