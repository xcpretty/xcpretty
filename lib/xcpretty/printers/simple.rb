require 'shellwords'

module XCPretty

  module Printer

    class Simple
      include Printer

      def pretty_print(text)
        formatted = pretty_format(text)
        STDOUT.puts(formatted) unless formatted.empty?
      end

      def pretty_format(text)
        case text
        when /^ProcessPCH/
          print_pch(text)
        when /^CompileC/
          print_compiling(text)
        when /^Clean.Remove/
          ""
        when /^Check dependencies/
          ""
        when /^=== CLEAN TARGET/
          print_clean_target(text)
        when /^=== BUILD TARGET/
          print_build_target(text)
        when /^PhaseScriptExecution/
          print_run_script(text)
        when /^Libtool/
          print_libtool(text)
        when /^CpResource/
          print_cpresource(text)
        when /^CopyStringsFile/
          print_copy_strings_file(text)
        when /^GenerateDSYMFile/
          print_generating_dsym(text)
        when /^ProcessInfoPlistFile/
          print_processing_info_plist(text)
        when /^Ld/
          print_linking(text)
        else
          ""
        end
      end

      def print_linking(text)
        "Linking #{text.shellsplit[1].split('/').last}"      
      end

      def print_pch(text)
        "Precompiling " + Shellwords.shellsplit(text)[2]
      end

      def print_processing_info_plist(text)
        "Processing #{text.lines.first.shellsplit.last.split('/').last}"
      end

      def print_compiling(text)
        "Compiling #{text.shellsplit[2].split('/').last}"
      end

      def print_clean_target(text)
        info = project_build_info(text)
        "Cleaning #{info[:project]}/#{info[:target]} [#{info[:configuration]}]"
      end

      def print_build_target(text)
        info = project_build_info(text)
        "Building #{info[:project]}/#{info[:target]} [#{info[:configuration]}]"
      end

      def print_run_script(text)
        "Running script '#{text.lines.first.shellsplit[1..-2].join(' ').gsub('\ ',' ')}'"
      end

      def print_libtool(text)
        "Building library #{text.shellsplit[1].split('/').last}"
      end

      def print_cpresource(text)
        "Copying #{text.shellsplit[1]}"
      end

      def print_copy_strings_file(text)
        "Copying #{text.shellsplit.last.split('/').last}"  
      end

      def print_generating_dsym(text)
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
end
