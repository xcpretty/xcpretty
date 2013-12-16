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

    it "parses build target" do
      @formatter.should receive(:format_build_target).with("The Spacer", "Pods", "Debug")
      @tokenizer.tokenize(SAMPLE_BUILD, @formatter)
    end

    it "parses clean remove" do
      @formatter.should receive(:format_clean_remove)
      @tokenizer.tokenize(SAMPLE_CLEAN_REMOVE, @formatter)
    end

    it "parses clean target" do
      @formatter.should receive(:format_clean_target).with("Pods-ObjectiveSugar", "Pods", "Debug")
      @tokenizer.tokenize(SAMPLE_CLEAN, @formatter)
    end

    it "parses clean target withut dash in target name" do
      @formatter.should receive(:format_clean_target).with("Pods", "Pods", "Debug")
      @tokenizer.tokenize(SAMPLE_ANOTHER_CLEAN, @formatter)
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

    it "parses CopyStringsFile" do
      @formatter.should receive(:format_copy_strings_file).with('InfoPlist.strings')
      @tokenizer.tokenize(SAMPLE_COPYSTRINGS, @formatter)
    end

    it "parses CpResource" do
      @formatter.should receive(:format_cpresource).with('ObjectiveSugar/Default-568h@2x.png')
      @tokenizer.tokenize(SAMPLE_CPRESOURCE, @formatter)
    end

    it "parses GenerateDSYMFile" do
      @formatter.should receive(:format_generate_dsym).with('ObjectiveSugarTests.octest.dSYM')
      @tokenizer.tokenize(SAMPLE_DSYM, @formatter)
    end
    
    it "parses info.plist processing" do
      @formatter.should receive(:format_process_info_plist).with('The Spacer-Info.plist')
      @tokenizer.tokenize(SAMPLE_PROCESS_INFOPLIST, @formatter)
    end

    it "parses Ld" do
      @formatter.should receive(:format_linking).with('ObjectiveSugar', 'normal', 'i386')
      @tokenizer.tokenize(SAMPLE_LD, @formatter)
    end

    it "parses Libtool" do
      @formatter.should receive(:format_libtool).with('libPods-ObjectiveSugarTests-Kiwi.a')
      @tokenizer.tokenize(SAMPLE_LIBTOOL, @formatter)
    end
    
    it "parses failing tests" do
      @formatter.should receive(:format_failing_test).with("RACCommandSpec", "enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES", "expected: 1, got: 0", "/Users/musalj/code/OSS/ReactiveCocoa/ReactiveCocoaFramework/ReactiveCocoaTests/RACCommandSpec.m:458")
      @tokenizer.tokenize(SAMPLE_SPECTA_FAILURE, @formatter)
    end

    it "parses passing tests" do
      @formatter.should receive(:format_passing_test).with('RACTupleSpec', '_tupleByAddingObject__should_add_a_non_nil_object', '0.001')
      @tokenizer.tokenize(SAMPLE_OCUNIT_TEST, @formatter)
    end

    it "parses PhaseScriptExecution" do
      @formatter.should receive(:format_phase_script_execution).with('Check Pods Manifest.lock')
      @tokenizer.tokenize(SAMPLE_RUN_SCRIPT, @formatter)
    end

    it "parses process PCH" do
      @formatter.should receive(:format_process_pch).with("Pods-CocoaLumberjack-prefix.pch")
      @tokenizer.tokenize(SAMPLE_PRECOMPILE, @formatter)
    end

    it "parses test run started" do
      @formatter.should receive(:format_test_run_started).with('ReactiveCocoaTests.octest(Tests)')
      @tokenizer.tokenize(SAMPLE_OCUNIT_TEST_RUN_BEGINNING, @formatter)
    end

    it "parses test suite started" do
      @formatter.should receive(:format_test_suite_started).with('RACKVOWrapperSpec')
      @tokenizer.tokenize(SAMPLE_OCUNIT_SUITE_BEGINNING, @formatter)
    end

  end
end
