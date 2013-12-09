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
