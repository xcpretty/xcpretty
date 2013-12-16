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

      it "formats build target/project/configuration with target" do
        @formatter.format_build_target("The Spacer", "Pods", "Debug").should ==
        "> Building Pods/The Spacer [Debug]"
      end
      
      it "formats clean target/project/configuration" do
        @formatter.format_clean_target("Pods-ObjectiveSugar", "Pods", "Debug").should ==
        "> Cleaning Pods/Pods-ObjectiveSugar [Debug]"
      end
      
      it "formats compiling output" do
        @formatter.format_compile("NSMutableArray+ObjectiveSugar.m").should ==
        "> Compiling NSMutableArray+ObjectiveSugar.m"
      end

      it "formats compiling xib output" do
        @formatter.format_compile_xib("MainMenu.xib").should ==
        "> Compiling MainMenu.xib"
      end

      it "formats copy resource" do
        @formatter.format_cpresource("ObjectiveSugar/Default-568h@2x.png").should ==
        "> Copying ObjectiveSugar/Default-568h@2x.png"
      end

      it "formats Copy strings file" do
        @formatter.format_copy_strings_file("InfoPlist.strings").should ==
        "> Copying InfoPlist.strings"
      end

      it "formats Libtool" do
        @formatter.format_libtool("libPods-ObjectiveSugarTests-Kiwi.a").should ==
        "> Building library libPods-ObjectiveSugarTests-Kiwi.a"
      end


      it "formats Phase Script Execution" do
        @formatter.format_phase_script_execution("Check Pods Manifest.lock").should ==
        "> Running script 'Check Pods Manifest.lock'"
      end

      it "formats precompiling output" do
        @formatter.format_process_pch("Pods-CocoaLumberjack-prefix.pch").should ==
        "> Precompiling Pods-CocoaLumberjack-prefix.pch"
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
