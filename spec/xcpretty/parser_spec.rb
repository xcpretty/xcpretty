require 'xcpretty'
require 'xcpretty/parser'
require 'fixtures/constants'

module XCPretty

  describe Parser do

    before(:each) do
      @formatter = Formatter.new(false, false)
      @parser = Parser.new(@formatter)
    end

    it "parses analyze" do
      @formatter.should receive(:format_analyze).with("CCChip8DisplayView.m", "CocoaChip/CCChip8DisplayView.m")
      @parser.parse(SAMPLE_ANALYZE)
    end

    it "parses analyze shallow" do
      @formatter.should receive(:format_analyze).with("CCChip8DisplayView.m", "CocoaChip/CCChip8DisplayView.m")
      @parser.parse(SAMPLE_ANALYZE_SHALLOW)
    end

    it "parses build target" do
      @formatter.should receive(:format_build_target).with("The Spacer", "Pods", "Debug")
      @parser.parse(SAMPLE_BUILD)
    end

    it "parses clean remove" do
      @formatter.should receive(:format_clean_remove)
      @parser.parse(SAMPLE_CLEAN_REMOVE)
    end

    it "parses clean target" do
      @formatter.should receive(:format_clean_target).with("Pods-ObjectiveSugar", "Pods", "Debug")
      @parser.parse(SAMPLE_CLEAN)
    end

    it "parses clean target withut dash in target name" do
      @formatter.should receive(:format_clean_target).with("Pods", "Pods", "Debug")
      @parser.parse(SAMPLE_ANOTHER_CLEAN)
    end

    it "parses check dependencies" do
      @formatter.should receive(:format_check_dependencies)
      @parser.parse("Check dependencies")
    end

    it "parses code signing" do
      @formatter.should receive(:format_codesign).with("build/Release/CocoaChip.app")
      @parser.parse(SAMPLE_CODESIGN)
    end

    it "parses code signing a framework" do
      @formatter.should receive(:format_codesign).with("build/Release/CocoaChipCore.framework")
      @parser.parse(SAMPLE_CODESIGN_FRAMEWORK)
    end

    it "parses compiling categories" do
      @formatter.should receive(:format_compile).with("NSMutableArray+ObjectiveSugar.m", "/Users/musalj/code/OSS/ObjectiveSugar/Classes/NSMutableArray+ObjectiveSugar.m")
      @parser.parse(SAMPLE_COMPILE)
    end

    it "parses compiling classes" do
      @formatter.should receive(:format_compile).with("KWNull.m", "Classes/Core/KWNull.m")
      @parser.parse(SAMPLE_ANOTHER_COMPILE)
    end

    it "parses compiling XIBs" do
      @formatter.should receive(:format_compile_xib).with("MainMenu.xib", "CocoaChip/en.lproj/MainMenu.xib")
      @parser.parse(SAMPLE_COMPILE_XIB)
    end

    it "parses CopyStringsFile" do
      @formatter.should receive(:format_copy_strings_file).with('InfoPlist.strings')
      @parser.parse(SAMPLE_COPYSTRINGS)
    end

    it "parses CpResource" do
      @formatter.should receive(:format_cpresource).with('ObjectiveSugar/Default-568h@2x.png')
      @parser.parse(SAMPLE_CPRESOURCE)
    end

    it "parses GenerateDSYMFile" do
      @formatter.should receive(:format_generate_dsym).with('ObjectiveSugarTests.octest.dSYM')
      @parser.parse(SAMPLE_DSYM)
    end

    it "parses info.plist processing" do
      @formatter.should receive(:format_process_info_plist).with('The Spacer-Info.plist', 'The Spacer/The Spacer-Info.plist')
      @parser.parse(SAMPLE_PROCESS_INFOPLIST)
    end

    it "parses Ld" do
      @formatter.should receive(:format_linking).with('ObjectiveSugar', 'normal', 'i386')
      @parser.parse(SAMPLE_LD)
    end

    it "parses Libtool" do
      @formatter.should receive(:format_libtool).with('libPods-ObjectiveSugarTests-Kiwi.a')
      @parser.parse(SAMPLE_LIBTOOL)
    end

    it "parses failing tests" do
      @formatter.should receive(:format_failing_test).with("RACCommandSpec",
                                                           "enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES",
                                                           "expected: 1, got: 0",
                                                           #"expect([command.enabled first]).to.equal(@YES);", # outside of PR scope
                                                           "/Users/musalj/code/OSS/ReactiveCocoa/ReactiveCocoaFramework/ReactiveCocoaTests/RACCommandSpec.m:458")
      @parser.parse(SAMPLE_SPECTA_FAILURE)
    end

    it "parses passing tests" do
      @formatter.should receive(:format_passing_test).with('RACCommandSpec',
                                                           'enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES',
                                                           '0.001')
      @parser.parse(SAMPLE_OCUNIT_TEST)
    end

    it "parses pending tests" do
      @formatter.should receive(:format_pending_test).with('TAPIConversationSpec',
                                                           'TAPIConversation_createConversation_SendsAPOSTRequestToTheConversationsEndpoint')
      @parser.parse(SAMPLE_PENDING_KIWI_TEST)
    end

    it "parses PhaseScriptExecution" do
      @formatter.should receive(:format_phase_script_execution).with('Check Pods Manifest.lock')
      @parser.parse(SAMPLE_RUN_SCRIPT)
    end

    it "parses process PCH" do
      @formatter.should receive(:format_process_pch).with("Pods-CocoaLumberjack-prefix.pch")
      @parser.parse(SAMPLE_PRECOMPILE)
    end

    it "parses preprocessing" do
      @formatter.should receive(:format_preprocess).with("CocoaChip/CocoaChip-Info.plist")
      @parser.parse(SAMPLE_PREPROCESS)
    end

    it "parses PBXCp" do
      @formatter.should receive(:format_pbxcp).with("build/Release/CocoaChipCore.framework")
      @parser.parse(SAMPLE_PBXCP)
    end

    it "parses Touch" do
      @formatter.should receive(:format_touch).with(
        '/Users/musalj/Library/Developer/Xcode/DerivedData/Alcatraz-aobuxcinaqyzjugrnxjjhfzgwaou/Build/Products/Debug/AlcatrazTests.octest',
        'AlcatrazTests.octest')
      @parser.parse(SAMPLE_TOUCH)
    end

    it "parses TiffUtil" do
      @formatter.should receive(:format_tiffutil).with('eye_icon.tiff')
      @parser.parse(SAMPLE_TIFFUTIL)
    end

    it "parses undefined symbols" do
      @formatter.should receive(:format_linker_failure).with("Undefined symbols for architecture x86_64",
                                                             '_OBJC_CLASS_$_CABasicAnimation',
                                                             'objc-class-ref in ATZRadialProgressControl.o')

      SAMPLE_UNDEFINED_SYMBOLS.each_line do |line|
        @parser.parse(line)
      end
    end

    it "parses test run finished" do
      @formatter.should receive(:format_test_run_finished).with('ReactiveCocoaTests.octest(Tests)', '2013-12-10 07:03:03 +0000.')
      @parser.parse(SAMPLE_OCUNIT_TEST_RUN_COMPLETION)
    end

    it "parses test run started" do
      @formatter.should receive(:format_test_run_started).with('ReactiveCocoaTests.octest(Tests)')
      @parser.parse(SAMPLE_OCUNIT_TEST_RUN_BEGINNING)
    end

    it "parses test suite started" do
      @formatter.should receive(:format_test_suite_started).with('RACKVOWrapperSpec')
      @parser.parse(SAMPLE_OCUNIT_SUITE_BEGINNING)
    end

    context "errors" do

      it "parses cocoapods errors" do
        @formatter.should receive(:format_error).with("The sandbox is not in sync with the Podfile.lock. Run 'pod install' or update your CocoaPods installation.")
        @parser.parse(SAMPLE_PODS_ERROR)
      end

      it "parses compiling errors" do
        @formatter.should receive(:format_compile_error).with(
          "SampleTest.m",
          "/Users/musalj/code/OSS/SampleApp/SampleTest.m:12:59",
          "expected identifier",
          "                [[thread.lastMessage should] equal:thread.];",
          "                                                          ^")
        SAMPLE_COMPILE_ERROR.each_line do |line|
          @parser.parse(line)
        end
      end

      it 'parses fatal compiling errors' do
        @formatter.should receive(:format_compile_error).with(
          'SomeRandomClass.h',
          '/Users/musalj/code/OSS/SampleApp/Pods/Headers/LessCoolPod/SomeRandomClass.h:31:9',
          "'SomeRandomHeader.h' file not found",
          '#import "SomeRandomHeader.h"',
          '        ^'
          # For now, it's probably not worth to provide the import stack
          # It'd require more state, and not sure if it'd be any useful
#%Q(In file included from /Users/musalj/code/OSS/SampleApp/Pods/SuperCoolPod/SuperAwesomeClass.m:12:
#In file included from /Users/musalj/code/OSS/SampleApp/Pods/../LessCoolPod/LessCoolClass.h:9:
#In file included from /Users/musalj/code/OSS/SampleApp/Pods/../LessCoolPod/EvenLessCoolClass.h:10:)
        )
        SAMPLE_FATAL_COMPILE_ERROR.each_line do |line|
          @parser.parse(line)
        end
      end

      it "parses compiling errors with tildes" do
        @formatter.should receive(:format_compile_error).with(
          'NSSetTests.m',
          '/Users/musalj/code/OSS/ObjectiveSugar/Example/ObjectiveSugarTests/NSSetTests.m:93:16',
          "no visible @interface for 'NSArray' declares the selector 'shoulds'",
          '            }] shoulds] equal:@[ @"F458 Italia", @"Testarossa" ]];',
          '            ~~ ^~~~~~~')
        SAMPLE_COMPILE_ERROR_WITH_TILDES.each_line do |line|
          @parser.parse(line)
        end
      end

      it "doesn't print the same error over and over" do
        SAMPLE_COMPILE_ERROR.each_line do |line|
          @parser.parse(line)
        end
        @formatter.should_not receive(:format_compile_error)
        @parser.parse("hohohoooo")
      end

    end


    context "summary" do

      def given_tests_have_started(reporter = SAMPLE_OCUNIT_TEST_RUN_BEGINNING)
        @parser.parse(reporter)
      end

      def given_tests_are_done(reporter = SAMPLE_OCUNIT_TEST_RUN_COMPLETION)
        @parser.parse(reporter)
      end

      def given_kiwi_tests_are_done
        @parser.parse(SAMPLE_KIWI_TEST_RUN_COMPLETION)
        @parser.parse(SAMPLE_EXECUTED_TESTS)
        @parser.parse(SAMPLE_KIWI_SUITE_COMPLETION)
      end

      it "returns empty string if the suite is not done" do
        @parser.parse(SAMPLE_EXECUTED_TESTS).should == ""
      end

      it "knows when the test suite is done for OCunit / Specta" do
        given_tests_are_done
        @formatter.should receive(:format_test_summary)
        @parser.parse(SAMPLE_EXECUTED_TESTS)
      end

      it "doesn't print executed message twice for Kiwi tests" do
        @formatter.should_receive(:format_test_summary).once
        given_tests_have_started(SAMPLE_KIWI_TEST_RUN_BEGINNING)
        given_kiwi_tests_are_done
      end

      it "knows when the test suite is done for XCtest" do
        @formatter.should_receive(:format_test_summary).once
        2.times {
          given_tests_are_done(SAMPLE_KIWI_TEST_RUN_COMPLETION)
          @parser.parse(SAMPLE_EXECUTED_TESTS)
        }
      end

      it "prints OCunit / XCTest summary twice if tests executed twice" do
        @formatter.should_receive(:format_test_summary).twice
        2.times {
          given_tests_have_started
          given_tests_are_done
          @parser.parse(SAMPLE_EXECUTED_TESTS)
        }
      end

      it "prints Kiwi summary twice if tests executed twice" do
        @formatter.should_receive(:format_test_summary).twice
        2.times {
          given_tests_have_started(SAMPLE_KIWI_TEST_RUN_BEGINNING)
          given_kiwi_tests_are_done
        }
      end

    end

  end
end
