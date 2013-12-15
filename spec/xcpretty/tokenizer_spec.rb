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

    it "parses analyze shallow" do
      @formatter.should receive(:format_analyze).with("CCChip8DisplayView.m")
      @tokenizer.tokenize(SAMPLE_ANALYZE_SHALLOW, @formatter)
    end

    it "parses clean remove" do
      @formatter.should receive(:format_clean_remove)
      @tokenizer.tokenize(SAMPLE_CLEAN_REMOVE, @formatter)
    end

    it "parses check dependencies" do
      @formatter.should receive(:format_check_dependencies)
      @tokenizer.tokenize("Check dependencies", @formatter)
    end

    it "parses compiling categories" do
      @formatter.should receive(:format_compile).with("NSMutableArray+ObjectiveSugar.m")
      @tokenizer.tokenize(SAMPLE_COMPILE, @formatter)
    end

    it "parses compiling classes" do
      @formatter.should receive(:format_compile).with("KWNull.m")
      @tokenizer.tokenize(SAMPLE_ANOTHER_COMPILE, @formatter)
    end

    it "parses compiling XIBs" do
      @formatter.should receive(:format_compile_xib).with("MainMenu.xib")
      @tokenizer.tokenize(SAMPLE_COMPILE_XIB, @formatter)
    end

    it "parses process PCH" do
      @formatter.should receive(:format_process_pch).with("Pods-CocoaLumberjack-prefix.pch")
      @tokenizer.tokenize(SAMPLE_PRECOMPILE, @formatter)
    end

    

  end

end
