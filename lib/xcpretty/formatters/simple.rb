# encoding: utf-8
require 'shellwords'

module XCPretty

  class Simple < Formatter

    PASS = "✓"
    FAIL = "✗"
    PENDING = "⧖"
    COMPLETION = "▸"
    MEASURE = '◷'

    ASCII_PASS = "."
    ASCII_FAIL = "x"
    ASCII_PENDING = "P"
    ASCII_COMPLETION = ">"
    ASCII_MEASURE = 'T'

    INDENT = "    "

    def format_analyze(path)
      format("Analyze", path.basename)
    end

    def format_build_target(target, project, configuration)
      format("Build", "#{project}/#{target} [#{configuration}]")
    end

    def format_aggregate_target(target, project, configuration)
      format("Aggregate", "#{project}/#{target} [#{configuration}]")
    end

    def format_analyze_target(target, project, configuration)
      format("Analyze", "#{project}/#{target} [#{configuration}]")
    end

    def format_clean_target(target, project, configuration)
      format("Clean", "#{project}/#{target} [#{configuration}]")
    end

    def format_compile(path)
      format("Compile", path.basename)
    end

    def format_compile_xib(path)
      format("Compile", path.basename)
    end

    def format_compile_storyboard(path)
      format("Compile", path.basename)
    end

    def format_copy_header_file(source, target)
      format("Copy", File.basename(source))
    end

    def format_copy_png_file(source, target)
      format("Copy", File.basename(source))
    end

    def format_copy_plist_file(source, target)
      format("Copy", File.basename(source))
    end

    def format_copy_strings_file(path)
      format("Copy", path.basename)
    end

    def format_copy_swift_libs(path)
      format("Copy Swift lib", path.basename)
    end

    def format_compile_asset_catalog(path)
      format("Compile Asset catalog", path.basename)
    end

    def format_compile_swift_sources()
      format("Compile Swift sources")
    end

    def format_cpresource(source, destination)
      format("Copy", source.basename)
    end

    def format_generate_dsym(dsym)
      format("Generate '#{dsym}'")
    end

    def format_libtool(path)
      format("Build library", path.basename)
    end

    def format_ld(path, build_variants, arch)
      format("Link", path.basename)
    end

    def format_phase_success(phase_name)
      format(phase_name.capitalize, "Succeeded")
    end

    def format_phase_script_execution(script_name)
      format("Run script", "'#{script_name}'")
    end

    def format_process_info_plist(path)
      format("Process", path.basename)
    end

    def format_process_pch(path)
      format("Precompile", path.basename)
    end

    def format_codesign(path)
      format("Sign", path.basename)
    end

    def format_preprocess(path)
      format("Preprocess", path.basename)
    end

    def format_pbxcp(path)
      format("Copy", path.basename)
    end

    def format_check_dependencies()
      format('Check Dependencies')
    end

    def format_test_run_started(name)
      heading("Test Suite", name, "started")
    end

    def format_test_suite_started(name)
      heading("", name, "")
    end

    def format_touch(path)
      format("Touch", path.basename)
    end

    def format_tiffutil(path)
      format("Validate", path.basename)
    end

    def format_merge_swift_module(path)
      format("Merge Swift module", path.basename)
    end

    def format_ditto(path)
      format("Ditto", path.basename)
    end

    def format_write_auxiliary_files()
      format("Write auxiliary files")
    end

    def format_write_file(path)
      format("Write file", path.basename)
    end

    def format_failing_test(suite, test_case, reason, path)
      output.puts format_test("#{test_case}, #{reason}", :fail)
    end

    def format_passing_test(suite, test_case, time)
      output.puts format_test("#{test_case} (#{colored_time(time)} seconds)",
                           :pass)
    end

    def format_pending_test(suite, test_case)
      output.puts format_test("#{test_case} [PENDING]", :pending)
    end

    def format_measuring_test(suite, test_case, time)
      output.puts format_test(
        "#{test_case} measured (#{colored_time(time)} seconds)", :measure
      )
    end

    def format_warning(message)
      output.puts INDENT + yellow(message)
    end

    private

    def heading(prefix, text, description)
      output.puts [prefix, white(text), description].join(" ").strip
    end

    def format(command, argument_text="", success=true)
      symbol = status_symbol(success ? :completion : :fail)
      output.puts [symbol, white(command), argument_text].join(" ").strip
    end

    def format_test(test_case, status)
      output.puts INDENT + [status_symbol(status), test_case].join(" ").strip
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
      when :measure
        yellow(use_unicode? ? MEASURE : ASCII_MEASURE)
      else
        ""
      end
    end

    def colored_time(time)
      case time.to_f
      when 0..0.025
        time
      when 0.026..0.100
        yellow(time)
      else
        red(time)
      end
    end

  end
end

