# encoding: utf-8

module XCPretty

  module Matchers

    # @regex Captured groups
    # $1 file_path
    # $2 file_name
    ANALYZE_MATCHER = /^Analyze(?:Shallow)?\s(.*\/(.*\.(?:m|mm|cc|cpp|c|cxx)))\s*/

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    BUILD_TARGET_MATCHER = /^=== BUILD TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH.*CONFIGURATION\s(.*)\s===/

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    AGGREGATE_TARGET_MATCHER = /^=== BUILD AGGREGATE TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH.*CONFIGURATION\s(.*)\s===/

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    ANALYZE_TARGET_MATCHER = /^=== ANALYZE TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH.*CONFIGURATION\s(.*)\s===/

    # @regex Nothing returned here for now
    CHECK_DEPENDENCIES_MATCHER = /^Check dependencies/

    # @regex Captured groups
    # $1 command path
    # $2 arguments
    SHELL_COMMAND_MATCHER = /^\s{4}(cd|setenv|(?:[\w\/:\\\s\-.]+?\/)?[\w\-]+)\s(.*)$/

    # @regex Nothing returned here for now
    CLEAN_REMOVE_MATCHER = /^Clean.Remove/

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    CLEAN_TARGET_MATCHER = /^=== CLEAN TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH CONFIGURATION\s(.*)\s===/

    # @regex Captured groups
    # $1 = file
    CODESIGN_MATCHER = /^CodeSign\s((?:\\ |[^ ])*)$/

    # @regex Captured groups
    # $1 = file
    CODESIGN_FRAMEWORK_MATCHER = /^CodeSign\s((?:\\ |[^ ])*.framework)\/Versions/

    # @regex Captured groups
    # $1 file_path
    # $2 file_name (e.g. KWNull.m)
    COMPILE_MATCHER = /^Compile[\w]+\s.+?\s((?:\\.|[^ ])+\/((?:\\.|[^ ])+\.(?:m|mm|c|cc|cpp|cxx|swift)))\s.*/

    # @regex Captured groups
    # $1 compiler_command
    # $2 file_path
    COMPILE_COMMAND_MATCHER = /^\s*(.*clang\s.*\s\-c\s(.*\.(?:m|mm|c|cc|cpp|cxx))\s.*\.o)$/

    # @regex Captured groups
    # $1 file_path
    # $2 file_name (e.g. MainMenu.xib)
    COMPILE_XIB_MATCHER = /^CompileXIB\s(.*\/(.*\.xib))/

    # @regex Captured groups
    # $1 file_path
    # $2 file_name (e.g. Main.storyboard)
    COMPILE_STORYBOARD_MATCHER = /^CompileStoryboard\s(.*\/([^\/].*\.storyboard))/

    # @regex Captured groups
    # $1 source file
    # $2 target file
    COPY_HEADER_MATCHER = /^CpHeader\s(.*\.h)\s(.*\.h)/

    # @regex Captured groups
    # $1 source file
    # $2 target file
    COPY_PLIST_MATCHER = /^CopyPlistFile\s(.*\.plist)\s(.*\.plist)/

    # $1 file
    COPY_STRINGS_MATCHER = /^CopyStringsFile.*\/(.*.strings)/

    # @regex Captured groups
    # $1 resource
    CPRESOURCE_MATCHER = /^CpResource\s(.*)\s\//

    # @regex Captured groups
    #
    EXECUTED_MATCHER = /^\s*Executed/

    # @regex Captured groups
    # $1 = file
    # $2 = test_suite
    # $3 = test_case
    # $4 = reason
    FAILING_TEST_MATCHER = /^\s*(.+:\d+):\serror:\s[\+\-]\[(.*)\s(.*)\]\s:(?:\s'.*'\s\[FAILED\],)?\s(.*)/

    # @regex Captured groups
    # $1 = file
    # $2 = reason
    UI_FAILING_TEST_MATCHER = /^\s{4}t = \s+\d+\.\d+s\s+Assertion Failure: (.*:\d+): (.*)$/

    # @regex Captured groups
    RESTARTING_TESTS_MATCHER = /^Restarting after unexpected exit or crash in.+$/

    # @regex Captured groups
    # $1 = dsym
    GENERATE_DSYM_MATCHER = /^GenerateDSYMFile \/.*\/(.*\.dSYM)/

    # @regex Captured groups
    # $1 = library
    LIBTOOL_MATCHER = /^Libtool.*\/(.*\.a)/

    # @regex Captured groups
    # $1 = target
    # $2 = build_variants (normal, profile, debug)
    # $3 = architecture
    LINKING_MATCHER = /^Ld \/?.*\/(.*?) (.*) (.*)$/

    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    # $3 = time
    TEST_CASE_PASSED_MATCHER = /^\s*Test Case\s'-\[(.*)\s(.*)\]'\spassed\s\((\d*\.\d{3})\sseconds\)/


    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    TEST_CASE_STARTED_MATCHER = /^Test Case '-\[(.*) (.*)\]' started.$/

    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    TEST_CASE_PENDING_MATCHER = /^Test Case\s'-\[(.*)\s(.*)PENDING\]'\spassed/

    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    # $3 = time
    TEST_CASE_MEASURED_MATCHER = /^[^:]*:[^:]*:\sTest Case\s'-\[(.*)\s(.*)\]'\smeasured\s\[Time,\sseconds\]\saverage:\s(\d*\.\d{3}),/

    PHASE_SUCCESS_MATCHER = /^\*\*\s(.*)\sSUCCEEDED\s\*\*/

    # @regex Captured groups
    # $1 = script_name
    PHASE_SCRIPT_EXECUTION_MATCHER = /^PhaseScriptExecution\s((\\\ |\S)*)\s/

    # @regex Captured groups
    # $1 = file
    PROCESS_PCH_MATCHER = /^ProcessPCH\s.*\s(.*.pch)/

    # @regex Captured groups
    # $1 file_path
    PROCESS_PCH_COMMAND_MATCHER = /^\s*.*\/usr\/bin\/clang\s.*\s\-c\s(.*)\s\-o\s.*/

    # @regex Captured groups
    # $1 = file
    PREPROCESS_MATCHER = /^Preprocess\s(?:(?:\\ |[^ ])*)\s((?:\\ |[^ ])*)$/

    # @regex Captured groups
    # $1 = file
    PBXCP_MATCHER = /^PBXCp\s((?:\\ |[^ ])*)/

    # @regex Captured groups
    # $1 = file
    PROCESS_INFO_PLIST_MATCHER = /^ProcessInfoPlistFile\s.*\.plist\s(.*\/+(.*\.plist))/

    # @regex Captured groups
    # $1 = suite
    # $2 = time
    TESTS_RUN_COMPLETION_MATCHER = /^\s*Test Suite '(?:.*\/)?(.*[ox]ctest.*)' (finished|passed|failed) at (.*)/

    # @regex Captured groups
    # $1 = suite
    # $2 = time
    TEST_SUITE_STARTED_MATCHER = /^\s*Test Suite '(?:.*\/)?(.*[ox]ctest.*)' started at(.*)/

    # @regex Captured groups
    # $1 test suite name
    TEST_SUITE_START_MATCHER = /^\s*Test Suite '(.*)' started at/

    # Swift Testing (Apple's testing framework, xcodebuild 16+) writes its own
    # block in the xcodebuild output, in addition to the classic XCTest lines.
    # Every Swift Testing line starts with a status marker glyph, optionally
    # wrapped in ANSI color codes and/or zero-width space indentation
    # (xcodebuild indents failure details with U+200B), followed by one or
    # two spaces. The markers include characters from Apple's SF Symbols
    # Private Use Area, so no character class can enumerate them - any
    # non-space character is accepted instead. Classic XCTest lines never
    # carry such a marker, so these matchers can never consume them, and
    # vice versa.
    SWIFT_TESTING_LINE = %r{^\s*(?:\u{200B}|\e\[[0-9;]*m)*[^ ]\s{1,2}}

    # @regex Captured groups
    # no groups
    SWIFT_TESTING_RUN_STARTED_MATCHER = /#{SWIFT_TESTING_LINE}Test run started\.$/

    # @regex Captured groups
    # $1 = suite name (quoted display name or bare symbol name)
    SWIFT_TESTING_SUITE_STARTED_MATCHER = /#{SWIFT_TESTING_LINE}Suite (.+) started\.$/

    # @regex Captured groups
    # $1 = test name (quoted display name or bare symbol name)
    SWIFT_TESTING_TEST_STARTED_MATCHER = /#{SWIFT_TESTING_LINE}Test (?!run )(.+) started\.$/

    # @regex Captured groups
    # $1 = parameterized test name
    # $2 = case count
    # $3 = time
    SWIFT_TESTING_TEST_CASES_PASSED_MATCHER = /#{SWIFT_TESTING_LINE}Test (.+) with (\d+) test cases passed after ([\d.]+) seconds\.$/

    # @regex Captured groups
    # $1 = parameterized test name
    # $2 = case count
    # $3 = time
    # $4 = issue count
    SWIFT_TESTING_TEST_CASES_FAILED_MATCHER = /#{SWIFT_TESTING_LINE}Test (.+) with (\d+) test cases failed after ([\d.]+) seconds with (\d+) issues?\.$/

    # @regex Captured groups
    # $1 = test name
    # $2 = file of the issue (the reason text may contain colons, so the
    #      line:column suffix is anchored right before the reason)
    # $3 = issue reason (may be empty; detail lines follow separately)
    SWIFT_TESTING_ISSUE_MATCHER = /#{SWIFT_TESTING_LINE}Test (.+) recorded an issue at (.*?):\d+:\d+: ([^\s].*)?$/

    # @regex Captured groups
    # $1 = test name
    # $2 = file of the issue
    # $3 = issue reason (argument dump form)
    SWIFT_TESTING_ISSUE_ARGUMENTS_MATCHER = /#{SWIFT_TESTING_LINE}Test (.+) recorded an issue with \d+ arguments.* at (.*?):\d+:\d+: ([^\s].*)?$/

    # @regex Captured groups
    # $1 = test name
    # $2 = time
    SWIFT_TESTING_TEST_PASSED_MATCHER = /#{SWIFT_TESTING_LINE}Test (?!run )(.+) passed after ([\d.]+) seconds\.$/

    # @regex Captured groups
    # $1 = test name
    # $2 = time
    # $3 = issue count
    SWIFT_TESTING_TEST_FAILED_MATCHER = /#{SWIFT_TESTING_LINE}Test (?!run )(.+) failed after ([\d.]+) seconds with (\d+) issues?\.$/

    # @regex Captured groups
    # $1 = test name
    # $2 = skip reason, if any
    SWIFT_TESTING_TEST_SKIPPED_MATCHER = /#{SWIFT_TESTING_LINE}Test (?!run )(.+) skipped(?:\.|:\s(.*))?$/

    # @regex Captured groups
    # $1 = test count
    # $2 = time
    SWIFT_TESTING_RUN_PASSED_MATCHER = /#{SWIFT_TESTING_LINE}Test run with (\d+) tests?(?: in \d+ suites?)? passed after ([\d.]+) seconds\.$/

    # @regex Captured groups
    # $1 = test count
    # $2 = time
    # $3 = issue count
    SWIFT_TESTING_RUN_FAILED_MATCHER = /#{SWIFT_TESTING_LINE}Test run with (\d+) tests?(?: in \d+ suites?)? failed after ([\d.]+) seconds with (\d+) issues?\.$/

    # @regex Captured groups
    # $1 file_name
    TIFFUTIL_MATCHER = /^TiffUtil\s(.*)/

    # @regex Captured groups
    # $1 file_path
    # $2 file_name
    TOUCH_MATCHER = /^Touch\s(.*\/(.+))/

    # @regex Captured groups
    # $1 file_path
    WRITE_FILE_MATCHER = /^write-file\s(.*)/

    # @regex Captured groups
    WRITE_AUXILIARY_FILES = /^Write auxiliary files/

    module Warnings
      # $1 = file_path
      # $2 = file_name
      # $3 = reason
      COMPILE_WARNING_MATCHER = /^(\/.+\/(.*):.*:.*):\swarning:\s(.*)$/

      # $1 = ld prefix
      # $2 = warning message
      LD_WARNING_MATCHER = /^(ld: )warning: (.*)/

      # @regex Captured groups
      # $1 = whole warning
      GENERIC_WARNING_MATCHER = /^warning:\s(.*)$/

      # @regex Captured groups
      # $1 = whole warning
      WILL_NOT_BE_CODE_SIGNED_MATCHER = /^(.* will not be code signed because .*)$/
    end

    module Errors
      # @regex Captured groups
      # $1 = whole error
      CLANG_ERROR_MATCHER = /^(clang: error:.*)$/

      # @regex Captured groups
      # $1 = whole error
      CHECK_DEPENDENCIES_ERRORS_MATCHER = /^(Code\s?Sign error:.*|Code signing is required for product type .* in SDK .*|No profile matching .* found:.*|Provisioning profile .* doesn't .*|Swift is unavailable on .*|.?Use Legacy Swift Language Version.*)$/

      # @regex Captured groups
      # $1 = whole error
      PROVISIONING_PROFILE_REQUIRED_MATCHER = /^(.*requires a provisioning profile.*)$/

      # @regex Captured groups
      # $1 = whole error
      NO_CERTIFICATE_MATCHER = /^(No certificate matching.*)$/

      # @regex Captured groups
      # $1 = file_path
      # $2 = file_name
      # $3 = reason
      COMPILE_ERROR_MATCHER = /^(\/.+\/(.*):.*:.*):\s(?:fatal\s)?error:\s(.*)$/

      # @regex Captured groups
      # $1 cursor (with whitespaces and tildes)
      CURSOR_MATCHER = /^([\s~]*\^[\s~]*)$/

      # @regex Captured groups
      # $1 = whole error.
      # it varies a lot, not sure if it makes sense to catch everything separately
      FATAL_ERROR_MATCHER = /^(fatal error:.*)$/

      # @regex Captured groups
      # $1 = whole error.
      # $2 = file path
      FILE_MISSING_ERROR_MATCHER = /^<unknown>:0:\s(error:\s.*)\s'(\/.+\/.*\..*)'$/

      # @regex Captured groups
      # $1 = whole error
      LD_ERROR_MATCHER = /^(ld:.*)/

      # @regex Captured groups
      # $1 file path
      LINKER_DUPLICATE_SYMBOLS_LOCATION_MATCHER = /^\s+(\/.*\.o[\)]?)$/

      # @regex Captured groups
      # $1 reason
      LINKER_DUPLICATE_SYMBOLS_MATCHER = /^(duplicate symbol .*):$/

      # @regex Captured groups
      # $1 symbol location
      LINKER_UNDEFINED_SYMBOL_LOCATION_MATCHER = /^(.* in .*\.o)$/

      # @regex Captured groups
      # $1 reason
      LINKER_UNDEFINED_SYMBOLS_MATCHER = /^(Undefined symbols for architecture .*):$/

      # @regex Captured groups
      # $1 reason
      PODS_ERROR_MATCHER = /^(error:\s.*)/

      # @regex Captured groups
      # $1 = reference
      SYMBOL_REFERENCED_FROM_MATCHER = /\s+"(.*)", referenced from:$/

      # @regex Captured groups
      # $1 = error reason
      MODULE_INCLUDES_ERROR_MATCHER = /^\<module-includes\>:.*?:.*?:\s(?:fatal\s)?(error:\s.*)$/
    end
  end

  class Parser

    include Matchers
    include Matchers::Errors
    include Matchers::Warnings

    attr_reader :formatter

    def load_dependencies
      unless @@loaded ||= false
        require 'erb'
        @@loaded = true
      end
    end

    def initialize(formatter)
      load_dependencies
      @formatter = formatter
      reset_swift_testing_state
    end

    def parse(text)
      update_test_state(text)
      update_error_state(text)
      update_linker_failure_state(text)

      return format_compile_error if should_format_error?
      return format_compile_warning if should_format_warning?
      return format_undefined_symbols if should_format_undefined_symbols?
      return format_duplicate_symbols if should_format_duplicate_symbols?

      case text
      when ANALYZE_MATCHER
        formatter.format_analyze($2, $1)
      when BUILD_TARGET_MATCHER
        formatter.format_build_target($1, $2, $3)
      when AGGREGATE_TARGET_MATCHER
        formatter.format_aggregate_target($1, $2, $3)
      when ANALYZE_TARGET_MATCHER
        formatter.format_analyze_target($1, $2, $3)
      when CLEAN_REMOVE_MATCHER
        formatter.format_clean_remove
      when CLEAN_TARGET_MATCHER
        formatter.format_clean_target($1, $2, $3)
      when COPY_STRINGS_MATCHER
        formatter.format_copy_strings_file($1)
      when CHECK_DEPENDENCIES_MATCHER
        formatter.format_check_dependencies
      when CLANG_ERROR_MATCHER
        formatter.format_error($1)
      when CODESIGN_FRAMEWORK_MATCHER
        formatter.format_codesign($1)
      when CODESIGN_MATCHER
        formatter.format_codesign($1)
      when CHECK_DEPENDENCIES_ERRORS_MATCHER
        formatter.format_error($1)
      when PROVISIONING_PROFILE_REQUIRED_MATCHER
        formatter.format_error($1)
      when NO_CERTIFICATE_MATCHER
        formatter.format_error($1)
      when COMPILE_MATCHER
        formatter.format_compile($2, $1)
      when COMPILE_COMMAND_MATCHER
        formatter.format_compile_command($1, $2)
      when COMPILE_XIB_MATCHER
        formatter.format_compile_xib($2, $1)
      when COMPILE_STORYBOARD_MATCHER
        formatter.format_compile_storyboard($2, $1)
      when COPY_HEADER_MATCHER
        formatter.format_copy_header_file($1, $2)
      when COPY_PLIST_MATCHER
        formatter.format_copy_plist_file($1, $2)
      when CPRESOURCE_MATCHER
        formatter.format_cpresource($1)
      when EXECUTED_MATCHER
        format_summary_if_needed(text)
      when RESTARTING_TESTS_MATCHER
        formatter.format_failing_test(@test_suite, @test_case, "Test crashed", "n/a")
      when UI_FAILING_TEST_MATCHER
        formatter.format_failing_test(@test_suite, @test_case, $2, $1)
      when FAILING_TEST_MATCHER
        formatter.format_failing_test($2, $3, ERB::Util.html_escape($4), $1)
      when FATAL_ERROR_MATCHER
        formatter.format_error($1)
      when FILE_MISSING_ERROR_MATCHER
        formatter.format_file_missing_error($1, $2)
      when GENERATE_DSYM_MATCHER
        formatter.format_generate_dsym($1)
      when LD_WARNING_MATCHER
        formatter.format_ld_warning($1 + $2)
      when LD_ERROR_MATCHER
        formatter.format_error($1)
      when LIBTOOL_MATCHER
        formatter.format_libtool($1)
      when LINKING_MATCHER
        formatter.format_linking($1, $2, $3)
      when MODULE_INCLUDES_ERROR_MATCHER
        formatter.format_error($1)
      when TEST_CASE_MEASURED_MATCHER
        formatter.format_measuring_test($1, $2, $3)
      when TEST_CASE_PENDING_MATCHER
        formatter.format_pending_test($1, $2)
      when TEST_CASE_PASSED_MATCHER
        formatter.format_passing_test($1, $2, $3)
      when PODS_ERROR_MATCHER
        formatter.format_error($1)
      when PROCESS_INFO_PLIST_MATCHER
        formatter.format_process_info_plist(*unescaped($2, $1))
      when PHASE_SCRIPT_EXECUTION_MATCHER
        formatter.format_phase_script_execution(*unescaped($1))
      when PHASE_SUCCESS_MATCHER
        formatter.format_phase_success($1)
      when PROCESS_PCH_MATCHER
        formatter.format_process_pch($1)
      when PROCESS_PCH_COMMAND_MATCHER
        formatter.format_process_pch_command($1)
      when PREPROCESS_MATCHER
        formatter.format_preprocess($1)
      when PBXCP_MATCHER
        formatter.format_pbxcp($1)
      when TESTS_RUN_COMPLETION_MATCHER
        formatter.format_test_run_finished($1, $3)
      when TEST_SUITE_STARTED_MATCHER
        formatter.format_test_run_started($1)
      when TEST_SUITE_START_MATCHER
        formatter.format_test_suite_started($1)
      when TIFFUTIL_MATCHER
        formatter.format_tiffutil($1)
      when TOUCH_MATCHER
        formatter.format_touch($1, $2)
      when WRITE_FILE_MATCHER
        formatter.format_write_file($1)
      when WRITE_AUXILIARY_FILES
        formatter.format_write_auxiliary_files
      when SHELL_COMMAND_MATCHER
        formatter.format_shell_command($1, $2)
      when GENERIC_WARNING_MATCHER
        formatter.format_warning($1)
      when WILL_NOT_BE_CODE_SIGNED_MATCHER
        formatter.format_will_not_be_code_signed($1)
      else
        dispatch_swift_testing(text) || formatter.format_other(text)
      end
    end

    private

    def update_test_state(text)
      case text
      when TEST_SUITE_STARTED_MATCHER
        @tests_done = false
        @formatted_summary = false
        @failures = {}
      when TEST_CASE_STARTED_MATCHER
        @test_suite = $1
        @test_case = $2
      when TESTS_RUN_COMPLETION_MATCHER
        @tests_done = true
      when FAILING_TEST_MATCHER
        store_failure(file: $1, test_suite: $2, test_case: $3, reason: $4)
      when UI_FAILING_TEST_MATCHER
        store_failure(file: $1, test_suite: @test_suite, test_case: @test_case, reason: $2)
      when RESTARTING_TESTS_MATCHER
        store_failure(file: "n/a", test_suite: @test_suite, test_case: @test_case, reason: "Test crashed")
      end
    end

    # @ return Hash { :file_name, :file_path, :reason, :line }
    def update_error_state(text)
      update_error = lambda {
        current_issue[:reason]    = $3
        current_issue[:file_path] = $1
        current_issue[:file_name] = $2
      }
      if text =~ COMPILE_ERROR_MATCHER
        @formatting_error = true
        update_error.call
      elsif text =~ COMPILE_WARNING_MATCHER
        @formatting_warning = true
        update_error.call
      elsif text =~ CURSOR_MATCHER
        current_issue[:cursor]    = $1.chomp
      elsif @formatting_error || @formatting_warning
        current_issue[:line]      = text.chomp
      end
    end

    def update_linker_failure_state(text)
      if text =~ LINKER_UNDEFINED_SYMBOLS_MATCHER ||
         text =~ LINKER_DUPLICATE_SYMBOLS_MATCHER

        current_linker_failure[:message] = $1
        @formatting_linker_failure = true
      end
      return unless @formatting_linker_failure

      case text
      when SYMBOL_REFERENCED_FROM_MATCHER
        current_linker_failure[:symbol] = $1
      when LINKER_UNDEFINED_SYMBOL_LOCATION_MATCHER
        current_linker_failure[:reference] = text.strip
      when LINKER_DUPLICATE_SYMBOLS_LOCATION_MATCHER
        current_linker_failure[:files] << $1
      end
    end

    # TODO: clean up the mess around all this
    def should_format_error?
      @formatting_error && error_or_warning_is_present
    end

    def should_format_warning?
      @formatting_warning && error_or_warning_is_present
    end

    def error_or_warning_is_present
      current_issue[:reason] && current_issue[:cursor] && current_issue[:line]
    end

    def should_format_undefined_symbols?
      current_linker_failure[:message] && current_linker_failure[:symbol] && current_linker_failure[:reference]
    end

    def should_format_duplicate_symbols?
      current_linker_failure[:message] && current_linker_failure[:files].count > 1
    end

    def current_issue
      @current_issue ||= {}
    end

    def current_linker_failure
      @linker_failure ||= {files: []}
    end

    def format_compile_error
      error = current_issue.dup
      @current_issue = {}
      @formatting_error = false
      formatter.format_compile_error(error[:file_name],
                                     error[:file_path],
                                     error[:reason],
                                     error[:line],
                                     error[:cursor])
    end

    def format_compile_warning
      warning = current_issue.dup
      @current_issue = {}
      @formatting_warning = false
      formatter.format_compile_warning(warning[:file_name],
                                       warning[:file_path],
                                       warning[:reason],
                                       warning[:line],
                                       warning[:cursor])
    end

    def format_undefined_symbols
      result = formatter.format_undefined_symbols(
        current_linker_failure[:message],
        current_linker_failure[:symbol],
        current_linker_failure[:reference]
      )
      reset_linker_format_state
      result
    end

    def format_duplicate_symbols
      result = formatter.format_duplicate_symbols(
        current_linker_failure[:message],
        current_linker_failure[:files]
      )
      reset_linker_format_state
      result
    end

    def reset_linker_format_state
      @linker_failure = nil
      @formatting_linker_failure = false
    end

    def store_failure(file: nil, test_suite: nil, test_case: nil, reason: nil)
      failures_per_suite[test_suite] ||= []
      failures_per_suite[test_suite] << {
        file_path: file,
        reason: reason,
        test_case: test_case
      }
    end

    def failures_per_suite
      @failures ||= {}
    end

    def format_summary_if_needed(executed_message)
      return "" unless should_format_summary?

      @formatted_summary = true
      formatter.format_test_summary(executed_message, failures_per_suite)
    end

    def should_format_summary?
      @tests_done && !@formatted_summary
    end

    def unescaped(*escaped_values)
      escaped_values.map { |v| v.delete('\\') }
    end

    # Synthetic testsuite name all Swift Testing results are grouped under:
    # tests run in parallel and their completion events carry no suite name.
    SWIFT_TESTING_SUITE_NAME = "Swift Testing".freeze

    # Cheap pre-filter: every Swift Testing event line starts with the marker
    # prefix followed by "Test"/"Suite". Matching that anchored prefix fails
    # almost immediately on unrelated build lines, whereas every full matcher
    # below would otherwise scan a whole (potentially very long) line.
    SWIFT_TESTING_CANDIDATE = /#{Matchers::SWIFT_TESTING_LINE}(?:Test|Suite) /.freeze

    def reset_swift_testing_state
      @swift_testing_issues = {}
      @swift_testing_failed = {}
    end

    def dispatch_swift_testing(text)
      return nil unless text =~ SWIFT_TESTING_CANDIDATE

      case text
      when SWIFT_TESTING_RUN_STARTED_MATCHER
        reset_swift_testing_state
        ""
      when SWIFT_TESTING_TEST_STARTED_MATCHER
        ""
      when SWIFT_TESTING_SUITE_STARTED_MATCHER
        formatter.format_test_suite_started(swift_testing_sanitize($1))
      when SWIFT_TESTING_ISSUE_ARGUMENTS_MATCHER
        record_swift_testing_issue($1, $2, $3)
      when SWIFT_TESTING_ISSUE_MATCHER
        record_swift_testing_issue($1, $2, $3)
      when SWIFT_TESTING_TEST_CASES_PASSED_MATCHER
        emit_swift_testing_passing($1, $3)
      when SWIFT_TESTING_TEST_PASSED_MATCHER
        emit_swift_testing_passing($1, $2)
      when SWIFT_TESTING_TEST_CASES_FAILED_MATCHER
        emit_swift_testing_failing($1, $4)
      when SWIFT_TESTING_TEST_FAILED_MATCHER
        emit_swift_testing_failing($1, $3)
      when SWIFT_TESTING_TEST_SKIPPED_MATCHER
        emit_swift_testing_skipped($1)
      when SWIFT_TESTING_RUN_PASSED_MATCHER, SWIFT_TESTING_RUN_FAILED_MATCHER
        format_swift_testing_summary_if_needed($1)
      end
    end

    # Apple quotes display names; symbol names are printed bare.
    def swift_testing_sanitize(name)
      name.gsub(/\A"|"\z/, "")
    end

    # Issue lines are emitted before the completion line of the test they
    # belong to, so their reasons are buffered until the test completes.
    def record_swift_testing_issue(name, file, reason)
      name = swift_testing_sanitize(name)
      swift_testing_issues[name] ||= []
      swift_testing_issues[name] << {file: file, reason: reason}
      ""
    end

    def swift_testing_issues
      @swift_testing_issues ||= {}
    end

    def emit_swift_testing_passing(name, time)
      name = swift_testing_sanitize(name)
      # A pass means Apple's known-issue path: issues recorded for a passing
      # test are expected and must not surface as failures.
      swift_testing_issues.delete(name)
      formatter.format_passing_test(SWIFT_TESTING_SUITE_NAME, name, time)
    end

    def emit_swift_testing_failing(name, issue_count)
      name = swift_testing_sanitize(name)
      # Parameterized parents repeat the outcome of their cases, so every
      # failing test is reported once.
      return "" if @swift_testing_failed[name]

      emit_swift_testing_failure(name, issue_count)
    end

    def emit_swift_testing_skipped(name)
      name = swift_testing_sanitize(name)
      swift_testing_issues.delete(name)
      formatter.format_pending_test(SWIFT_TESTING_SUITE_NAME, name)
    end

    def emit_swift_testing_failure(name, issue_count = nil)
      @swift_testing_failed[name] = true
      issues = swift_testing_issues.delete(name) || []
      reason = issues.map { |issue| issue[:reason] }.compact.reject(&:empty?).join("; ")
      if reason.empty?
        reason = if issue_count
                   "Failed with #{issue_count} #{issue_count == 1 ? "issue" : "issues"}"
                 else
                   "Failed"
                 end
      end
      file = issues.map { |issue| issue[:file] }.compact.first || "n/a"
      reason = ERB::Util.html_escape(reason)
      store_failure(file: file, test_suite: SWIFT_TESTING_SUITE_NAME,
                    test_case: name, reason: reason)
      formatter.format_failing_test(SWIFT_TESTING_SUITE_NAME, name, reason, file)
    end

    # Swift Testing completion lines arrive after all Swift Testing test
    # events and report their own totals, so the Swift Testing block gets its
    # own summary. It deliberately bypasses should_format_summary?: in a mixed
    # log the XCTest summary is emitted before the Swift Testing block, and
    # both summaries have to appear.
    def format_swift_testing_summary_if_needed(test_count)
      # Whatever is still buffered belongs to a test that crashed before its
      # completion line; report it as a failure instead of dropping silently.
      swift_testing_issues.keys.each do |name|
        emit_swift_testing_failure(name)
      end

      failures = failures_per_suite.select do |suite, _|
        suite == SWIFT_TESTING_SUITE_NAME
      end
      count = failures.fetch(SWIFT_TESTING_SUITE_NAME, []).size
      formatter.format_test_summary(
        "Swift Testing: Test run with #{test_count} " \
        "#{test_count.to_i == 1 ? "test" : "tests"}, with #{count} " \
        "#{count == 1 ? "failure" : "failures"}",
        failures
      )
    end

  end
end

