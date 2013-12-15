module XCPretty

  module Matchers

    # @regex Captured groups
    # $1 file
    ANALYZE_MATCHER = /^Analyze(?:Shallow)?\s(?:.*\/)(.*.m)*/

    # @regex Nothnig returned here for now
    CHECK_DEPENDENCIES_MATCHER = /^Check dependencies/

    # @regex Nothnig returned here for now
    CLEAN_REMOVE_MATCHER = /^Clean.Remove/

    # @regex Captured groups
    # $1 file (short path, e.g. KWNull.m)
    COMPILE_MATCHER = /^CompileC\s.*\s.*\/(.*.m)(?:\s.*){4}/

    # @regex Captured groups
    # $1 file (short path, e.g. MainMenu.xib)
    COMPILE_XIB_MATCHER = /^CompileXIB\s.*\/(.*\.xib)/


    EXECUTED_MATCHER = /^Executed/

    # @regex Captured groups
    # $1 = file
    # $2 = test_suite
    # $3 = test_case
    # $4 = reason
    FAILING_TEST_MATCHER = /(.+:\d+):\serror:\s[\+\-]\[(.*)\s(.*)\]\s:(?:\s'.*'\s\[FAILED\],)?\s(.*)/

    # @regex Captured groups
    # $1 = test_case
    # $2 = time
    PASSING_TEST_MATCHER = /Test Case\s'-\[.*\s(.*)\]'\spassed\s\((\d*\.\d{3})\sseconds\)/

    # @regex Captured groups
    # $1 = file
    PROCESS_PCH_MATCHER = /^ProcessPCH\s.*\s(.*.pch)/

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
      when CLEAN_REMOVE_MATCHER
        formatter.format_clean_remove
      when CHECK_DEPENDENCIES_MATCHER
        formatter.format_check_dependencies
      when COMPILE_MATCHER
        formatter.format_compile($1)
      when COMPILE_XIB_MATCHER
        formatter.format_compile_xib($1)
      when PROCESS_PCH_MATCHER
        formatter.format_process_pch($1)
      end
    end
  end
end
