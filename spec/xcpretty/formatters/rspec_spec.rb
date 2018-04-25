require "spec_helper"
require "xcpretty"
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

      it "prints dots for passing tests" do
        @formatter.format_passing_device_test("sweez testz", "sample spec", "0.002", "iPhone X").should == "."
      end

      it "prints P for pending tests" do
        @formatter.format_pending_device_test("sweez testz", "sample spec", "iPhone X").should == "P"
      end

      it "prints F for failing tests" do
        @formatter.format_failing_device_test(
          "///file", "NSNumber Specs", "adding numbers", "should add 2 numbers", nil
        ).should == "F"
      end
    end

    context "with colors" do

      before { @formatter.colorize = true }

      it "prints green for passing tests" do
        @formatter.format_passing_device_test("sweez testz", "sample spec", "0.002", "iPhone X"
        ).should be_colored :green
      end

      it "prints yellow for pending tests" do
        @formatter.format_pending_device_test("sweez testz", "sample spec", "iPhone X"
        ).should be_colored :yellow
      end

      it "prints red for failing tests" do
        @formatter.format_failing_device_test(
          "///file", "NSNumber Specs", "adding numbers", "should add 2 numbers", nil
        ).should be_colored :red
      end
    end
  end
end

