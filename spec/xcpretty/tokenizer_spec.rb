require 'xcpretty'
require 'xcpretty/tokenizer'
require 'fixtures/constants'

module XCPretty

  describe Tokenizer do

    before(:each) do
      @tokenizer = Tokenizer.new
      @formatter = Formatter.new(false, false)
    end

    it "parses analyze" do
      @formatter.should receive(:format_analyze).with("CCChip8DisplayView.m")
      @tokenizer.tokenize(SAMPLE_ANALYZE, @formatter)
    end


  end

end
