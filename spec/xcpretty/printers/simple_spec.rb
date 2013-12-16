require "xcpretty/printer"
require "xcpretty/printers/simple"
require "fixtures/constants"

module XCPretty

  module Printer

    describe Simple do

      it "prints to stdout" do
        STDOUT.should receive(:print)
        subject.pretty_print(SAMPLE_CLEAN)
      end

      it "doesn't print empty lines" do
        STDOUT.should_not receive(:print)
        subject.pretty_print("")
      end

      it "parses compiling output" do
        subject.pretty_format(SAMPLE_COMPILE).should ==
        "> Compiling NSMutableArray+ObjectiveSugar.m"
      end

      it "parses another compiling output" do
        subject.pretty_format(SAMPLE_ANOTHER_COMPILE).should ==
        "> Compiling KWNull.m"
      end

      it "parses compiling xib output" do
        subject.pretty_format(SAMPLE_COMPILE_XIB).should ==
        "> Compiling MainMenu.xib"
      end

      it "parses precompiling output" do
        subject.pretty_format(SAMPLE_PRECOMPILE).should ==
        "> Precompiling Pods-CocoaLumberjack-prefix.pch"
      end

      it "parses another precompiling output" do
        subject.pretty_format(SAMPLE_ANOTHER_PRECOMPILE).should ==
        "> Precompiling Pods-CrittercismSDK-prefix.pch"
      end

      it "parses clean remove output" do
        subject.pretty_format(SAMPLE_CLEAN_REMOVE).should == ""
      end

      it "kills 'Check dependencies'" do
        subject.pretty_format("Check dependencies").should == ""
      end

      it "parses clean target/project/configuration" do
        subject.pretty_format(SAMPLE_CLEAN).should ==
        "> Cleaning Pods/ObjectiveSugar [Debug]"
      end

      it "parses another clean target/project/configuration" do
        subject.pretty_format(SAMPLE_ANOTHER_CLEAN).should ==
        "> Cleaning Pods/Pods [Debug]"
      end

      it "parses build target/project/configuration with target" do
        subject.pretty_format(SAMPLE_BUILD).should ==
        "> Building Pods/The Spacer [Debug]"
      end

      it "parses clean target/project/configuration with nested pods" do
        subject.pretty_format(SAMPLE_CLEAN_NESTED_PODS).should ==
        "> Cleaning Pods/Kiwi [Debug]"
      end

      it "parses PhaseScriptExecution" do
        subject.pretty_format(SAMPLE_RUN_SCRIPT).should ==
        "> Running script 'Check Pods Manifest.lock'"
      end

      it "parses Libtool" do
        subject.pretty_format(SAMPLE_LIBTOOL).should ==
        "> Building library libPods-ObjectiveSugarTests-Kiwi.a"
      end

      it "parses CpResource" do
        subject.pretty_format(SAMPLE_CPRESOURCE).should ==
        "> Copying ObjectiveSugar/Default-568h@2x.png"
      end

      it "parses CopyStringsFile" do
        subject.pretty_format(SAMPLE_COPYSTRINGS).should ==
        "> Copying InfoPlist.strings"
      end

      it "parses GenerateDSYMFile" do
        subject.pretty_format(SAMPLE_DSYM).should ==
        "> Generating DSYM file"
      end

      it "parses info.plist processing" do
        subject.pretty_format(SAMPLE_PROCESS_INFOPLIST).should ==
        "> Processing The Spacer-Info.plist"
      end

      it "parses Ld" do
        subject.pretty_format(SAMPLE_LD).should ==
        "> Linking ObjectiveSugar"
      end

      it "parses analyze" do
        subject.pretty_format(SAMPLE_ANALYZE).should ==
        "> Analyzing CCChip8DisplayView.m"
      end

      it "parses analyze shallow" do
        subject.pretty_format(SAMPLE_ANALYZE_SHALLOW).should ==
        "> Analyzing CCChip8DisplayView.m"
      end

      it "parses passing tests" do
        subject.pretty_format(SAMPLE_OCUNIT_TEST).should ==
        ". _tupleByAddingObject__should_add_a_non_nil_object (0.001 seconds)"
      end

      it "parses failing tests" do
        subject.pretty_format(SAMPLE_SPECTA_FAILURE).should ==
        "x enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0"
      end

      it "parses test run started" do
        subject.pretty_format(SAMPLE_OCUNIT_TEST_RUN_BEGINNING).should ==
        "Test Suite ReactiveCocoaTests.octest(Tests) started"
      end

      it "parses test suite started" do
        subject.pretty_format(SAMPLE_OCUNIT_SUITE_BEGINNING).should ==
        "RACKVOWrapperSpec"
      end

      it "parses build warning" do
        subject.pretty_format(SAMPLE_COMPILE_WARNING).should ==
        "x Warning     /Users/berceg/Documents/source/someProject/NiceClassName.m:85:18:  warns you about incompatible pointer types initializing 'NSArray *' with an expression of type"
      end

    end
  end
end
