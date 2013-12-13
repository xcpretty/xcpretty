require 'spec_helper'
require "xcpretty/formatters/rspec"

module XCPretty

  describe RSpec do

    before(:each) do
      @formatter = RSpec.new(false, false)
    end

    it "prints dots in the same line" do
      @formatter.optional_newline.should == ""
    end

    context "without colors" do

      it "prints green dots for passing tests" do
        @formatter.pretty_format(SAMPLE_OCUNIT_TEST).should == "."
      end

      it "prints F for failing tests" do
        @formatter.pretty_format(SAMPLE_KIWI_FAILURE).should == "F"
      end
    end

    context "with colors" do

      before { @formatter.colorize = true }

      it "prints green for passing tests" do
        @formatter.pretty_format(SAMPLE_OCUNIT_TEST).should be_colored :green
      end

      it "prints red for failing tests" do
        @formatter.pretty_format(SAMPLE_KIWI_FAILURE).should be_colored :red
      end
    end

    describe "doesn't output any compiling output" do

      it "compiling output" do
        @formatter.pretty_format(SAMPLE_COMPILE).should == ""
      end

      it "clean target/project/configuration with nested pods" do
        @formatter.pretty_format(SAMPLE_CLEAN).should == ""
      end
    end
  end
end
