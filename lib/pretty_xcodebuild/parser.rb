module PrettyXcodebuild
  class Parser

    def parse(text)
      case text
      when /^ProcessPCH/
        parse_pch(text)
      when /^CompileC/
        parse_compiling(text)
      else
        nil
      end
    end

    def parse_pch(text)
      "Precompile #{text.split(' ')[2]}"
    end

    def parse_compiling(text)
      "Compile #{text.split(' ')[2].split('/').last}"
    end

  end
end
