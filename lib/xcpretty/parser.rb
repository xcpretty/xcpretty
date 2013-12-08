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
      else
        text
      end
    end

    def parse_pch(text)
      "Precompiling #{text.split(' ')[2]}"
    end

    def parse_compiling(text)
      "Compiling #{text.split(' ')[2].split('/').last}"
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
      text =~ /PhaseScriptExecution\s([\w\s\\]*\s.+?)\s/
      "Running script '#{$1}'"
    end

    def parse_libtool(text)
      "Building library #{text.split(' ')[1].split('/').last}"
    end

    def parse_cpresource(text)
      "Copying #{text.split(' ')[1]}"
    end

    def project_build_info(text)
      target = text.split('OF PROJECT').first.split(' ').last
      clean_target = target.split('-').last
      project = text.split('OF PROJECT').last.split(' ').first
      configuration = text.split('WITH CONFIGURATION').last.split(' ').first
      { :target => clean_target, :project => project, :configuration => configuration }
    end

  end
end
