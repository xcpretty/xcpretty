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
      target = text.split('OF PROJECT').first.split(' ').last
      clean_target = target.split('-').last
      project = text.split('OF PROJECT').last.split(' ').first
      configuration = text.split('WITH CONFIGURATION').last.split(' ').first

      "Cleaning #{project}/#{clean_target} [#{configuration}]"
    end

  end
end
