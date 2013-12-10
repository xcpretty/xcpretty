require "spec_helper"
require "xcpretty/printer"
require "xcpretty/printers/rspec"

module XCPretty

  module Printer

    describe RSpec do

      it "prints dots in the same line" do
        STDOUT.should receive(:print)
        subject.pretty_print(SAMPLE_OCUNIT_TEST)
      end

      context "without colors" do

        it "prints green dots for passing tests" do
          subject.pretty_format(SAMPLE_OCUNIT_TEST).should == "."
        end

        it "prints F for failing tests" do
          subject.pretty_format(SAMPLE_KIWI_FAILURE).should == "F"
        end
      end

      context "with colors" do

        before { subject.colorize = true }

        it "prints green for passing tests" do
          subject.pretty_format(SAMPLE_OCUNIT_TEST).should be_colored :green
        end

        it "prints red for failing tests" do
          subject.pretty_format(SAMPLE_KIWI_FAILURE).should be_colored :red
        end
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
