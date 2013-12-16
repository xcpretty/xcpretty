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
      when /^GenerateDSYMFile/
        format_generating_dsym(text)
      when /^ProcessInfoPlistFile/
        format_processing_info_plist(text)
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

    def format_clean_target(target, project, configuration)
      format("Cleaning", "#{project}/#{target} [#{configuration}]")
    end

    def format_compile(file)
      format("Compiling", file)
    end    

    def format_compile_xib(file)
      format("Compiling", file)
    end

    def format_copy_strings_file(file)
      format("Copying", file)
    end

    def format_cpresource(resource)
      format("Copying", resource)
    end

    def format_libtool(library)
      format("Building library", library)
    end

    def format_linking(target)
      format("Linking", target)
    end

    def format_phase_script_execution(script_name)
      format("Running script", "'#{script_name}'")
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

    def format_processing_info_plist(text)
      format("Processing", text.lines.first.shellsplit.last.split('/').last)
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
      [prefix, white(text), description].join(" ").strip
    end

    def format(command, argument_text="", success=true)
      [status_symbol(success ? :completion : :fail), white(command), argument_text].join(" ").strip
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
