# require "spec_helper"
require "xcpretty/printer"

module XCPretty

  describe Printer do

    before(:each) do
      STDOUT.stub(:print) { |text| text }
      @printer = Printer.new(:colorize => true, :use_unicode => true, :formatter => XCPretty::Simple)
    end

    def executed_tests_message
      @printer.format_test_summary(SAMPLE_EXECUTED_TESTS)
    end

    def given_tests_are_done(reporter = SAMPLE_XCTEST_SUITE_COMPLETION)
      @printer.pretty_print(reporter)
    end

    def given_kiwi_tests_are_done
      @printer.pretty_print(SAMPLE_XCTEST_SUITE_COMPLETION)
      @printer.pretty_print(SAMPLE_EXECUTED_TESTS)
      @printer.pretty_print(SAMPLE_KIWI_SUITE_COMPLETION)
    end

    def executed_tests_message
      @printer.format_test_summary(SAMPLE_EXECUTED_TESTS)
    end

    def given_tests_are_done(reporter = SAMPLE_XCTEST_SUITE_COMPLETION)
      @printer.pretty_print(reporter)
    end

    def given_tests_have_started(reporter = SAMPLE_OCUNIT_TEST_RUN_BEGINNING)
      @printer.pretty_print(reporter)  
    end

    def given_kiwi_tests_are_done
      @printer.pretty_print(SAMPLE_KIWI_TEST_RUN_COMPLETION)
      @printer.pretty_print(SAMPLE_EXECUTED_TESTS)
      @printer.pretty_print(SAMPLE_KIWI_SUITE_COMPLETION)
    end

    it "prints to stdout" do
      STDOUT.should receive(:print)
      @printer.pretty_print(SAMPLE_CLEAN)
    end

    it "doesn't print empty lines" do
      STDOUT.should_not receive(:print)
      @printer.pretty_print("")
    end

    # Probably move this to Formatter. We shouldn't be testing internals.
    it "prints with newlines when needed" do
      @printer.formatter.should receive(:optional_newline).and_return("\n")
      @printer.pretty_print(SAMPLE_CLEAN)
    end

    it "knows when the test suite is done for OCunit / Specta" do
      executed_tests_message.should == ""

      given_tests_are_done
      executed_tests_message.should ==  "\n\n#{SAMPLE_EXECUTED_TESTS}"
    end

    it "knows when the test suite is done for XCtest" do
      executed_tests_message.should == ""

      given_tests_are_done
      executed_tests_message.should ==  "\n\n#{SAMPLE_EXECUTED_TESTS}"
    end

    it "prints out Kiwi failures nicely" do
      @printer.pretty_print(SAMPLE_KIWI_FAILURE)
      @printer.pretty_print(SAMPLE_KIWI_FAILURE)
      given_tests_are_done(SAMPLE_KIWI_TEST_RUN_COMPLETION)
      executed_tests_message.should include(%Q(
NumberAdditions
  Iterators_TimesIteratesTheExactNumberOfTimes, expected subject to equal 4, got 5
  /Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:49

  Iterators_TimesIteratesTheExactNumberOfTimes, expected subject to equal 4, got 5
  /Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:49


#{SAMPLE_EXECUTED_TESTS}))
    end

    it "prints out specta failures nicely" do
      @printer.pretty_print(SAMPLE_SPECTA_FAILURE)
      @printer.pretty_print(SAMPLE_SPECTA_FAILURE)
      given_tests_are_done
      executed_tests_message.should include(%Q(
RACCommandSpec
  enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0
  /Users/musalj/code/OSS/ReactiveCocoa/ReactiveCocoaFramework/ReactiveCocoaTests/RACCommandSpec.m:458

  enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0
  /Users/musalj/code/OSS/ReactiveCocoa/ReactiveCocoaFramework/ReactiveCocoaTests/RACCommandSpec.m:458


#{SAMPLE_EXECUTED_TESTS}))
    end

    it "doesn't print executed message twice for Kiwi tests" do
      given_tests_have_started(SAMPLE_KIWI_TEST_RUN_BEGINNING)
      given_tests_are_done(SAMPLE_KIWI_TEST_RUN_COMPLETION)
      executed_tests_message.should ==  "\n\n#{SAMPLE_EXECUTED_TESTS}"

      given_tests_are_done(SAMPLE_KIWI_SUITE_COMPLETION)
      executed_tests_message.should ==  ""
    end

    it "prints OCunit / XCTest summary twice if tests executed twice" do
      2.times do
        given_tests_have_started
        given_tests_are_done
        executed_tests_message.should ==  "\n\n#{SAMPLE_EXECUTED_TESTS}"

        given_tests_are_done(SAMPLE_XCTEST_SUITE_COMPLETION)
        executed_tests_message.should ==  ""
      end
    end

    it "prints Kiwi summary twice if tests executed twice" do
      2.times do
        given_tests_have_started(SAMPLE_KIWI_TEST_RUN_BEGINNING)
        given_tests_are_done(SAMPLE_KIWI_TEST_RUN_COMPLETION)
        executed_tests_message.should ==  "\n\n#{SAMPLE_EXECUTED_TESTS}"

        given_tests_are_done(SAMPLE_KIWI_SUITE_COMPLETION)
        executed_tests_message.should ==  ""
      end
    end

  end
end
