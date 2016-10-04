require "spec_helper"
require "xcpretty"
require "xcpretty/formatters/rspec"

module XCPretty

  describe RSpec do

    let(:result) { @out.string.chomp }

    before(:each) do
      @out = StringIO.new
      @formatter = RSpec.new(@out, colorize: false, use_unicode: false)
    end

    context "without colors" do

      it "prints dots for passing tests" do
        @formatter.format_passing_test("sweez testz", "sample spec", "0.002")
        result.should == "."
      end

      it "prints P for pending tests" do
        @formatter.format_pending_test("sweez testz", "sample spec")
        result.should == "P"
      end

      it "prints F for failing tests" do
        @formatter.format_failing_test(
          "///file", "NSNumber Specs", "adding numbers", "should add 2 numbers"
        )
        result.should == "F"
      end
    end

    context "with colors" do

      before { @formatter.colorize = true }

      it "prints green for passing tests" do
        @formatter.format_passing_test("sweez testz", "sample spec", "0.002"
        )
        result.should be_colored :green
      end

      it "prints yellow for pending tests" do
        @formatter.format_pending_test("sweez testz", "sample spec"
        )
        result.should be_colored :yellow
      end

      it "prints red for failing tests" do
        @formatter.format_failing_test(
          "///file", "NSNumber Specs", "adding numbers", "should add 2 numbers"
        )
        result.should be_colored :red
      end
    end
  end
end

