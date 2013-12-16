module XCPretty

  module Matchers

    # FILE_PATH_MATCHER

    # @regex Captured groups
    # $1 file
    ANALYZE_MATCHER = /^Analyze(?:Shallow)?\s(?:.*\/)(.*.m)*/

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    BUILD_TARGET_MATCHER = /^=== BUILD TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH.*CONFIGURATION\s(.*)\s===/

    # @regex Nothnig returned here for now
    CHECK_DEPENDENCIES_MATCHER = /^Check dependencies/

    # @regex Nothnig returned here for now
    CLEAN_REMOVE_MATCHER = /^Clean.Remove/

    # @regex Captured groups
    # $1 target
    # $2 project
    # $3 configuration
    CLEAN_TARGET_MATCHER = /^=== CLEAN TARGET\s(.*)\sOF PROJECT\s(.*)\sWITH CONFIGURATION\s(.*)\s===/

    # @regex Captured groups
    # $1 file (short path, e.g. KWNull.m)
    COMPILE_MATCHER = /^CompileC\s.*\s.*\/(.*.m)(?:\s.*){4}/

    # @regex Captured groups
    # $1 file (short path, e.g. MainMenu.xib)
    COMPILE_XIB_MATCHER = /^CompileXIB\s.*\/(.*\.xib)/

    # @regex Captured groups
    # $1 file
    COPY_STRINGS_MATCHER = /^CopyStringsFile.*\/(.*.strings)/

    # @regex Captured groups
    # $1 resource
    CPRESOURCE_MATCHER = /^CpResource\s(.*)\s\//

    EXECUTED_MATCHER = /^Executed/

    # @regex Captured groups
    # $1 = file
    # $2 = test_suite
    # $3 = test_case
    # $4 = reason
    FAILING_TEST_MATCHER = /(.+:\d+):\serror:\s[\+\-]\[(.*)\s(.*)\]\s:(?:\s'.*'\s\[FAILED\],)?\s(.*)/

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
    LINKING_MATCHER = /^Ld \/.*\/(.*) (.*) (.*)$/

    # @regex Captured groups
    # $1 = suite
    # $2 = test_case
    # $3 = time
    PASSING_TEST_MATCHER = /^Test Case\s'-\[(.*)\s(.*)\]'\spassed\s\((\d*\.\d{3})\sseconds\)/

    # @regex Captured groups
    # $1 = script_name
    PHASE_SCRIPT_EXECUTION_MATCHER = /^PhaseScriptExecution\s(.*)\s\//

    # @regex Captured groups
    # $1 = file
    PROCESS_PCH_MATCHER = /^ProcessPCH\s.*\s(.*.pch)/


    # @regex Captured groups
    # $1 = file
    PROCESS_INFO_PLIST_MATCHER = /^ProcessInfoPlistFile .*\/(.*.plist)$/

    # @regex Captured groups
    # $1 = suite
    # $2 = time
    TESTS_RUN_COMPLETION_MATCHER = /Test Suite '(?:.*\/)?(.*[ox]ctest.*)' finished at(.*)/

    # @regex Captured groups
    # $1 = suite
    # $2 = time
    TESTS_RUN_START_MATCHER = /Test Suite '(?:.*\/)?(.*[ox]ctest.*)' started at(.*)/

    # @regex Captured groups
    # $1 test suite name
    TEST_SUITE_START_MATCHER = /Test Suite '(.*)' started at/
  end

  class Tokenizer
    
    include Matchers

    def tokenize(text, formatter)
      case text
      when ANALYZE_MATCHER
        formatter.format_analyze($1)
      when BUILD_TARGET_MATCHER
        formatter.format_build_target($1, $2, $3)
      when CLEAN_REMOVE_MATCHER
        formatter.format_clean_remove
      when CLEAN_TARGET_MATCHER
        formatter.format_clean_target($1, $2, $3)
      when COPY_STRINGS_MATCHER
        formatter.format_copy_strings_file($1)
      when CHECK_DEPENDENCIES_MATCHER
        formatter.format_check_dependencies
      when COMPILE_MATCHER
        formatter.format_compile($1)
      when COMPILE_XIB_MATCHER
        formatter.format_compile_xib($1)
      when CPRESOURCE_MATCHER
        formatter.format_cpresource($1)
      when FAILING_TEST_MATCHER
        formatter.format_failing_test($2, $3, $4, $1)
      when GENERATE_DSYM_MATCHER
        formatter.format_generate_dsym($1)
      when LIBTOOL_MATCHER
        formatter.format_libtool($1)
      when LINKING_MATCHER
        formatter.format_linking($1, $2, $3)
      when PASSING_TEST_MATCHER
        formatter.format_passing_test($1, $2, $3)
      when PROCESS_INFO_PLIST_MATCHER
        formatter.format_process_info_plist($1.gsub('\\', ''))
      when PHASE_SCRIPT_EXECUTION_MATCHER
        formatter.format_phase_script_execution($1.gsub('\\', ''))
      when PROCESS_PCH_MATCHER
        formatter.format_process_pch($1)
      when TESTS_RUN_START_MATCHER
        formatter.format_test_run_started($1)
      when TEST_SUITE_START_MATCHER
        formatter.format_test_suite_started($1)
      end
    end

  end
end
