require "xcpretty/printer"
require "xcpretty/printers/rspec"
require "fixtures/constants"

module XCPretty

  module Printer

    describe RSpec do

      before(:each) do
        STDOUT.stub(:print) { |text| text }
      end

      it "prints dots in the same line" do
        STDOUT.should receive(:print)
        subject.pretty_print(SAMPLE_OCUNIT_TEST)
      end

      it "prints dots for passing tests" do
        subject.pretty_format(SAMPLE_OCUNIT_TEST).should == "."
      end

      it "prints F for failing tests" do
        subject.pretty_format(SAMPLE_KIWI_FAILURE).should == "F"
      end

      def given_tests_are_done(reporter = KIWI)
        if reporter == KIWI
          subject.pretty_format("Test Suite 'All tests' finished at 2013-12-08 04:26:49 +0000.")
        else
          subject.pretty_format("Test Suite '/Users/musalj/Library/Developer/Xcode/DerivedData/ReactiveCocoa-eznxkbqvgfsnrvetemqloysuwagb/Build/Products/Test/ReactiveCocoaTests.octest(Tests)' finished at 2013-12-08 22:09:37 +0000.")
        end
      end

      def executed_tests_message
        subject.pretty_format(SAMPLE_EXECUTED_TESTS)
      end

      it "knows when the test suite is done for Kiwi" do
        executed_tests_message.should == ""

        given_tests_are_done
        executed_tests_message.should == "\n\n#{SAMPLE_EXECUTED_TESTS}"
      end

      it "knows when the test suite is done for OCunit / Specta" do
        executed_tests_message.should == ""

        given_tests_are_done(OCUNIT)
        executed_tests_message.should == "\n\n#{SAMPLE_EXECUTED_TESTS}"
      end


      it "prints out Kiwi failures nicely" do
        subject.pretty_print(SAMPLE_KIWI_FAILURE)
        given_tests_are_done
        executed_tests_message.should include(%Q(
NumberAdditions Iterators_TimesIteratesTheExactNumberOfTimes, expected subject to equal 4, got 5
/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSNumberTests.m:49


#{SAMPLE_EXECUTED_TESTS}))
      end

      it "prints out specta failures nicely" do
        subject.pretty_print(SAMPLE_SPECTA_FAILURE)
        given_tests_are_done
        executed_tests_message.should include(%Q(
RACCommandSpec enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0
/Users/musalj/code/OSS/ReactiveCocoa/ReactiveCocoaFramework/ReactiveCocoaTests/RACCommandSpec.m:458


#{SAMPLE_EXECUTED_TESTS}))
      end

      describe "doesn't output any compiling output" do

        it "compiling output" do
          subject.pretty_format(SAMPLE_COMPILE).should == ""
        end

        it "clean target/project/configuration with nested pods" do
          subject.pretty_format(SAMPLE_CLEAN).should == ""
        end
      end
    end
  end
end
