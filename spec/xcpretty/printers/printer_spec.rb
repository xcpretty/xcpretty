require "spec_helper"
require "xcpretty/printer"

module XCPretty

  module Printer

    describe Printer do

      include Printer

      def pretty_format(text)
        ""
      end

      def executed_tests_message
        format_test_summary(SAMPLE_EXECUTED_TESTS)
      end

      def given_tests_are_done(reporter = SAMPLE_XCTEST_SUITE_COMPLETION)
        pretty_print(reporter)
      end

      def given_kiwi_tests_are_done
        pretty_print(SAMPLE_XCTEST_SUITE_COMPLETION)
        pretty_print(SAMPLE_EXECUTED_TESTS)
        pretty_print(SAMPLE_KIWI_SUITE_COMPLETION)
      end

      before(:each) do
        STDOUT.stub(:print) { |text| text }
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
        pretty_print(SAMPLE_KIWI_FAILURE)
        given_tests_are_done
        executed_tests_message.should include(%Q(
NumberAdditions Iterators_TimesIteratesTheExactNumberOfTimes, expected subject to equal 4, got 5
/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:49


#{SAMPLE_EXECUTED_TESTS}))
      end

      it "prints out specta failures nicely" do
        pretty_print(SAMPLE_SPECTA_FAILURE)
        given_tests_are_done
        executed_tests_message.should include(%Q(
RACCommandSpec enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0
/Users/musalj/code/OSS/ReactiveCocoa/ReactiveCocoaFramework/ReactiveCocoaTests/RACCommandSpec.m:458


#{SAMPLE_EXECUTED_TESTS}))
      end

      it "doesn't print executed message twice for Kiwi tests" do
        Printer.instance_variable_set(:@printed_summary, false)
        given_kiwi_tests_are_done
        executed_tests_message.should == ""
      end

    end
  end
end
