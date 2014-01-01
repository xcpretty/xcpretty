# encoding: utf-8
require 'shellwords'

module XCPretty

  class Simple < Formatter

    PASS = "✓"
    FAIL = "✗"
    PENDING = "⧖"

    ASCII_PASS = "."
    ASCII_FAIL = "x"
    COMPLETION = "▸"
    ASCII_PENDING = "P"
    ASCII_COMPLETION = ">"

    def format_analyze(file_name, file_path)
      format("Analyzing", file_name)
    end

    def format_build_target(target, project, configuration)
      format("Building", "#{project}/#{target} [#{configuration}]")
    end

    def format_clean_target(target, project, configuration)
      format("Cleaning", "#{project}/#{target} [#{configuration}]")
    end

    def format_compile(file_name, file_path)
      format("Compiling", file_name)
    end

    def format_compile_xib(file_name, file_path)
      format("Compiling", file_name)
    end

    def format_copy_strings_file(file)
      format("Copying", file)
    end

    def format_cpresource(resource)
      format("Copying", resource)
    end

    def format_generate_dsym(dsym)
      format("Generating '#{dsym}'")
    end

    def format_libtool(library)
      format("Building library", library)
    end

    def format_linking(target, build_variants, arch)
      format("Linking", target)
    end

    def format_failing_test(suite, test_case, reason, file)
      format_test("#{test_case}, #{reason}", :fail)
    end

    def format_passing_test(suite, test_case, time)
      format_test("#{test_case} (#{time} seconds)", :pass)
    end

    def format_pending_test(suite, test_case)
      format_test("#{test_case} [PENDING]", :pending)
    end

    def format_phase_script_execution(script_name)
      format("Running script", "'#{script_name}'")
    end

    def format_process_info_plist(file_name, file_path)
      format("Processing", file_name)
    end

    def format_process_pch(file)
      format("Precompiling", file)
    end

    def format_codesign(file)
      format("Signing", file)
    end

    def format_preprocess(file)
      format("Preprocessing", file)
    end

    def format_pbxcp(file)
      format("Copying", file)
    end

    def format_test_run_started(name)
      heading("Test Suite", name, "started")
    end

    def format_test_suite_started(name)
      heading("", name, "")
    end

    def format_touch(file_path, file_name)
      format("Touching", file_name)
    end

    def format_tiffutil(file_name)
      format("Validating", file_name)
    end

    private

    def heading(prefix, text, description)
      [prefix, white(text), description].join(" ").strip
    end

    def format(command, argument_text="", success=true)
      [status_symbol(success ? :completion : :fail), white(command), argument_text].join(" ").strip
    end

    def format_test(test_case, status)
      [status_symbol(status), test_case].join(" ").strip
    end

    def status_symbol(status)
      case status
      when :pass
        green(use_unicode? ? PASS : ASCII_PASS)
      when :fail
        red(use_unicode? ? FAIL : ASCII_FAIL)
      when :pending
        yellow(use_unicode? ? PENDING : ASCII_PENDING)
      when :error
        red(use_unicode? ? ERROR : ASCII_ERROR)
      when :completion
        yellow(use_unicode? ? COMPLETION : ASCII_COMPLETION)
      else
        ""
      end
    end

  end
end
