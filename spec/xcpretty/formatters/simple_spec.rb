require 'xcpretty/formatters/formatter'
require "xcpretty/formatters/simple"
require "fixtures/constants"

module XCPretty

    describe Simple do

      before(:each) do
        @formatter = Simple.new(false, false)
      end

      it "formats analyzing" do
        @formatter.format_analyze("CCChip8DisplayView.m").should ==
        "> Analyzing CCChip8DisplayView.m"
      end

      it "formats compiling output" do
        @formatter.format_compile("NSMutableArray+ObjectiveSugar.m").should ==
        "> Compiling NSMutableArray+ObjectiveSugar.m"
      end

      it "formats compiling xib output" do
        @formatter.format_compile_xib("MainMenu.xib").should ==
        "> Compiling MainMenu.xib"
      end

      it "formats precompiling output" do
        @formatter.pretty_format(SAMPLE_PRECOMPILE).should ==
        "> Precompiling Pods-CocoaLumberjack-prefix.pch"
      end

      it "parses clean target/project/configuration" do
        @formatter.pretty_format(SAMPLE_CLEAN).should ==
        "> Cleaning Pods/ObjectiveSugar [Debug]"
      end

      it "parses another clean target/project/configuration" do
        @formatter.pretty_format(SAMPLE_ANOTHER_CLEAN).should ==
        "> Cleaning Pods/Pods [Debug]"
      end

      it "parses build target/project/configuration with target" do
        @formatter.pretty_format(SAMPLE_BUILD).should ==
        "> Building Pods/The Spacer [Debug]"
      end

      it "parses clean target/project/configuration with nested pods" do
        @formatter.pretty_format(SAMPLE_CLEAN_NESTED_PODS).should ==
        "> Cleaning Pods/Kiwi [Debug]"
      end

      it "parses PhaseScriptExecution" do
        @formatter.pretty_format(SAMPLE_RUN_SCRIPT).should ==
        "> Running script 'Check Pods Manifest.lock'"
      end

      it "parses Libtool" do
        @formatter.pretty_format(SAMPLE_LIBTOOL).should ==
        "> Building library libPods-ObjectiveSugarTests-Kiwi.a"
      end

      it "parses CpResource" do
        @formatter.pretty_format(SAMPLE_CPRESOURCE).should ==
        "> Copying ObjectiveSugar/Default-568h@2x.png"
      end

      it "parses CopyStringsFile" do
        @formatter.pretty_format(SAMPLE_COPYSTRINGS).should ==
        "> Copying InfoPlist.strings"
      end

      it "parses GenerateDSYMFile" do
        @formatter.pretty_format(SAMPLE_DSYM).should ==
        "> Generating DSYM file"
      end

      it "parses info.plist processing" do
        @formatter.pretty_format(SAMPLE_PROCESS_INFOPLIST).should ==
        "> Processing The Spacer-Info.plist"
      end

      it "parses Ld" do
        @formatter.pretty_format(SAMPLE_LD).should ==
        "> Linking ObjectiveSugar"
      end

      it "parses passing tests" do
        @formatter.pretty_format(SAMPLE_OCUNIT_TEST).should ==
        ". _tupleByAddingObject__should_add_a_non_nil_object (0.001 seconds)"
      end

      it "parses failing tests" do
        @formatter.pretty_format(SAMPLE_SPECTA_FAILURE).should ==
        "x enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0"
      end

      it "parses test run started" do
        @formatter.pretty_format(SAMPLE_OCUNIT_TEST_RUN_BEGINNING).should ==
        "Test Suite ReactiveCocoaTests.octest(Tests) started"
      end

      it "parses test suite started" do
        @formatter.pretty_format(SAMPLE_OCUNIT_SUITE_BEGINNING).should ==
        "RACKVOWrapperSpec"
      end
    end
end
