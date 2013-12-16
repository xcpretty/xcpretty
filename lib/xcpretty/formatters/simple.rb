# encoding: utf-8
require 'shellwords'

module XCPretty

  class Simple < Formatter

    PASS = "✓"
    FAIL = "✗"
    ASCII_PASS = "."
    ASCII_FAIL = "x"
    COMPLETION = "▸"
    ASCII_COMPLETION = ">"

    def pretty_format(text)
      case text
      when /^Libtool/
        format_libtool(text)
      when /^CpResource/
        format_cpresource(text)
      when /^CopyStringsFile/
        format_copy_strings_file(text)
      when /^GenerateDSYMFile/
        format_generating_dsym(text)
      when /^ProcessInfoPlistFile/
        format_processing_info_plist(text)
      when /^Ld/
        format_linking(text)
      when PASSING_TEST_MATCHER
        format_passing_test($1, $2)
      when FAILING_TEST_MATCHER
        format_failing_test($3, $4)
      when TESTS_RUN_START_MATCHER
        format_test_run_start($1)
      when TEST_SUITE_START_MATCHER
        format_suite_start($1)
      else
        ""
      end
    end

    def format_analyze(file)
      format("Analyzing", file)
    end
    
    def format_build_target(target, project, configuration)
      format("Building", "#{project}/#{target} [#{configuration}]")
    end

    def format_compile(file)
      format("Compiling", file)
    end
    
    def format_clean_target(target, project, configuration)
      format("Cleaning", "#{project}/#{target} [#{configuration}]")
    end

    def format_compile_xib(file)
      format("Compiling", file)
    end

    def format_process_pch(file)
      format("Precompiling", file)
    end



    def format_failing_test(test_case, reason)
      format_test("#{test_case}, #{reason}", false)
    end

    def format_passing_test(test_case, time)
      format_test("#{test_case} (#{time} seconds)")
    end

    def format_linking(text)
      format("Linking", text.shellsplit[1].split('/').last)
    end

    def format_phase_script_execution(script_name)
      format("Running script", "'#{script_name}'")
    end

    def format_processing_info_plist(text)
      format("Processing", text.lines.first.shellsplit.last.split('/').last)
    end


    def format_libtool(text)
      format("Building library", text.shellsplit[1].split('/').last)
    end

    def format_cpresource(text)
      format("Copying", text.shellsplit[1])
    end

    def format_copy_strings_file(text)
      format("Copying", text.shellsplit.last.split('/').last)
    end

    def format_generating_dsym(text)
      format("Generating DSYM file")
    end

    def format_test_run_start(name)
      heading("Test Suite", name, "started")  
    end

    def format_suite_start(name)
      heading("", name, "")
    end

    def heading(prefix, text, description)
      heading_text = colorize? ? white(text) : text
      [prefix, heading_text, description].join(" ").strip
    end

    def format(command, argument_text="", success=true)
      command_text = colorize? ? white(command) : command
      [status_symbol(success ? :completion : :fail), command_text, argument_text].join(" ").strip
    end

    def format_test(test_case, success=true)
      [status_symbol(success ? :pass : :fail), test_case].join(" ").strip
    end

    def status_symbol(status)
      case status
      when :pass
        green(use_unicode? ? PASS : ASCII_PASS)
      when :fail
        red(use_unicode? ? FAIL : ASCII_FAIL)
      when :completion
        yellow(use_unicode? ? COMPLETION : ASCII_COMPLETION)
      else
        ""
      end
    end
    
  end
end
