require 'xcpretty/formatters/formatter'
require "xcpretty/formatters/simple"
require "fixtures/constants"
require 'pathname'

module XCPretty

    describe Simple do

      let(:result) { @out.string.chomp }

      before(:each) do
        @out = StringIO.new
        @formatter = Simple.new(@out, colorize: false, use_unicode: false)
      end

      it "formats analyzing" do
        @formatter.format_analyze(Pathname.new("/path/to/CCChip8DisplayView.m"))
        result.should == "> Analyze CCChip8DisplayView.m"
      end

      it "formats build target/project/configuration with target" do
        @formatter.format_build_target("The Spacer", "Pods", "Debug")
        result.should == "> Build Pods/The Spacer [Debug]"
      end

      it "formats build target/project/configuration with target" do
        @formatter.format_aggregate_target("Be Aggro", "AggregateExample", "Debug")
        result.should == "> Aggregate AggregateExample/Be Aggro [Debug]"
      end

      it "formats analyze target/project/configuration with target" do
        @formatter.format_analyze_target("The Spacer", "Pods", "Debug")
        result.should == "> Analyze Pods/The Spacer [Debug]"
      end

      it "formats clean target/project/configuration" do
        @formatter.format_clean_target("Pods-ObjectiveSugar", "Pods", "Debug")
        result.should == "> Clean Pods/Pods-ObjectiveSugar [Debug]"
      end

      it 'formats compiler warnings' do
        warning = 'warning: stuff is broken'
        @formatter.format_warning(warning)
        result.should == '    ' + warning
      end

      it 'formats write auxiliary files' do
        @formatter.format_write_auxiliary_files()
        result.should == "> Write auxiliary files"
      end

      it 'formats write file' do
        @formatter.format_write_file(Pathname.new("/foo/bar/baz.swift"))
        result.should == "> Write file baz.swift"
      end

      it "formats compiling output" do
        @formatter.format_compile(Pathname.new("/path/to/NSMutableArray+ObjectiveSugar.m"))
        result.should == "> Compile NSMutableArray+ObjectiveSugar.m"
      end

      it 'formats create universal binary' do
        @formatter.format_create_universal_binary(Pathname.new("/path/to/BinaryKit"))
        result.should == "> Create Universal Binary BinaryKit"
      end

      it "formats compiling xib output" do
        @formatter.format_compile_xib(Pathname.new("/path/to/MainMenu.xib"))
        result.should == "> Compile MainMenu.xib"
      end

      it 'formats Link Storyboards' do
        @formatter.format_link_storyboards
        result.should == "> Link Storyboards"
      end

      it "formats compiling storyboard output" do
        @formatter.format_compile_xib(Pathname.new("/path/to/Main.storyboard"))
        result.should == "> Compile Main.storyboard"
      end

      it 'formats copying header files' do
        @formatter.format_copy_header_file('Source.h',
                                           'dir/Destination.h')
        result.should == '> Copy Source.h'
      end

      it 'formats copying header files' do
        @formatter.format_copy_png_file('/path/to/Default-568h@2x.png',
                                        'build/Example.app/Default-568h@2x.png')
        result.should == '> Copy Default-568h@2x.png'
      end

      it 'formats copying plist files' do
        @formatter.format_copy_plist_file("Source.plist",
                                          'dir/Destination.plist')
        result.should == '> Copy Source.plist'
      end

      it 'formats copying swift libs' do
        @formatter.format_copy_swift_libs(Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods_Lyft.framework"))
        result.should == '> Copy Swift lib Pods_Lyft.framework'
      end

      it 'formats compile asset catalog' do
        @formatter.format_compile_asset_catalog(Pathname.new("foo/Images.xcassets"))
        result.should == '> Compile Asset catalog Images.xcassets'
      end

      it 'formats compile swift sources with module optimization' do
        @formatter.format_compile_swift_with_module_optimization([
          Pathname.new("/foo/bar/baz/yolo+a.swift"),
          Pathname.new("/foo/bar/baz/yolo+b.swift"),
          Pathname.new("/foo/bar/baz/yolo+c.swift")
        ])
        result.should ==
          "> Compile Swift files (with module optimization):\n" \
          "  yolo+a.swift\n" \
          "  yolo+b.swift\n" \
          "  yolo+c.swift"
      end

      it 'formats compile swift sources' do
        @formatter.format_compile_swift_sources()
        result.should == '> Compile Swift sources'
      end

      it "formats copy resource" do
        @formatter.format_cpresource(Pathname.new("ObjectiveSugar/Default-568h@2x.png"),
                                     Pathname.new("/path/to/wat/Default-568h@2x.png"))
        result.should == "> Copy Default-568h@2x.png"
      end

      it "formats Copy strings file" do
        @formatter.format_copy_strings_file(Pathname.new("/path/to/InfoPlist.strings"))
        result.should == "> Copy InfoPlist.strings"
      end

      it "formats Ditto" do
        @formatter.format_ditto(Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit-Swift.h"))
        result.should == "> Ditto SnapKit-Swift.h"
      end

      it "formats GenerateDSYMFile" do
        @formatter.format_generate_dsym(Pathname.new("/a/b/ObjectiveSugarTests.octest.dSYM"))
        result.should == "> Generate ObjectiveSugarTests.octest.dSYM"
      end

      it "formats SymLink" do
        @formatter.format_symlink(Pathname.new("/foo/bar"), Pathname.new("/foo/baz"))
        result.should == "> SymLink bar"
      end

      it 'formats swift code generation' do
        @formatter.format_swift_code_generation(Pathname.new("/foo/asdf.bc"))
        result.should == "> Generate Swift Code asdf.bc"
      end

      it 'formats strip' do
        @formatter.format_strip(Pathname.new("/foo/bar/asdf"))
        result.should == "> Strip asdf"
      end

      it 'formats set owner and group' do
        @formatter.format_set_owner_and_group("marin:staff", Pathname.new("/foo/bar/yolo.mirakul"))
        result.should == "> Set Owner And Group (marin:staff) on yolo.mirakul"
      end

      it 'formats set mode' do
        @formatter.format_set_mode("u+w,go-w,a+rX", Pathname.new("/foo/bar/baz"))
        result.should == "> Set Mode (u+w,go-w,a+rX) on baz"
      end

      it "formats info.plist processing" do
        @formatter.format_process_info_plist(Pathname.new("/paht/to/The Spacer-Info.plist"))
        result.should == "> Process The Spacer-Info.plist"
      end

      it "formats Linking" do
        @formatter.format_ld(Pathname.new("/path/to/ObjectiveSugar.app/ObjectiveSugar"), 'normal', 'i386')
        result.should == "> Link ObjectiveSugar"
      end

      it "formats Libtool" do
        @formatter.format_libtool(Pathname.new("/path/to/ObjectiveSugarTests.a"))
        result.should ==
        "> Build library ObjectiveSugarTests.a"
      end

      it "formats failing tests" do
        @formatter.format_failing_test("RACCommandSpec", "enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES", "expected: 1, got: 0", 'path/to/file')
        result.should ==
        "    x enabled_signal_should_send_YES_while_executing_is_YES_and_allowsConcurrentExecution_is_YES, expected: 1, got: 0\n"
      end

      it "formats passing tests" do
        @formatter.format_passing_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object", "0.001")
        result.should ==
        "    . _tupleByAddingObject__should_add_a_non_nil_object (0.001 seconds)\n"
      end

      it "formats pending tests" do
        @formatter.format_pending_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object")
        result.should ==
        "    P _tupleByAddingObject__should_add_a_non_nil_object [PENDING]\n"
      end

      it "formats measuring tests" do
        @formatter.format_measuring_test("RACCommandSpec", "_tupleByAddingObject__should_add_a_non_nil_object", "0.001")
        result.should ==
        "    T _tupleByAddingObject__should_add_a_non_nil_object measured (0.001 seconds)\n"
      end

      it "formats build success output" do
        @formatter.format_phase_success("BUILD")
        result.should == "> Build Succeeded"
      end

      it "formats clean success output" do
        @formatter.format_phase_success("CLEAN")
        result.should == "> Clean Succeeded"
      end

      it "formats Phase Script Execution" do
        @formatter.format_phase_script_execution("Check Pods Manifest.lock")
        result.should ==
        "> Run script 'Check Pods Manifest.lock'"
      end

      it "formats precompiling output" do
        @formatter.format_process_pch(Pathname.new("/path/to/Pods-CocoaLumberjack-prefix.pch"))
        result.should ==
        "> Precompile Pods-CocoaLumberjack-prefix.pch"
      end

      it "formats code signing" do
        @formatter.format_codesign(Pathname.new("/path/to/build/Release/CocoaChip.app"))
        result.should ==
        "> Sign CocoaChip.app"
      end

      it "formats code signature unchanged" do
        @formatter.format_code_signature_unchanged(Pathname.new("/foo/bar.dylib"))
        result.should ==
          "> Code signature of bar.dylib is unchanged; keeping original"
      end

      it "formats codesigning swift lib" do
        @formatter.format_codesigning_swift_lib(Pathname.new("/foo/bar.dylib"))
        result.should ==
          "> Sign bar.dylib"
      end

      it "formats probing swift lib" do
        @formatter.format_probing_swift_lib(Pathname.new("/foo/bar.dylib"))
        result.should ==
          "> Probe signature of bar.dylib"
      end

      it "formats preprocessing a file" do
        @formatter.format_preprocess(Pathname.new("CocoaChip/CocoaChip-Info.plist"))
        result.should ==
        "> Preprocess CocoaChip-Info.plist"
      end

      it "formats PBXCp" do
        @formatter.format_pbxcp(Pathname.new("build/Release/CocoaChipCore.framework"))
        result.should ==
        "> Copy CocoaChipCore.framework"
      end

      it "formats test run start" do
        @formatter.format_test_run_started("ReactiveCocoaTests.octest(Tests)")
        result.should ==
        "Test Suite ReactiveCocoaTests.octest(Tests) started"
      end

      it "formats tests suite started" do
        @formatter.format_test_suite_started("RACKVOWrapperSpec")
        result.should ==
        "RACKVOWrapperSpec"
      end

      it "formats Touch" do
        @formatter.format_touch(Pathname.new("/path/to/SomeFile.txt"))
        result.should ==
        "> Touch SomeFile.txt"
      end

      it "formats TiffUtil" do
        @formatter.format_tiffutil(Pathname.new("/path/to/unbelievable.tiff"))
        result.should ==
        "> Validate unbelievable.tiff"
      end

      it 'formats Check Dependencies' do
        @formatter.format_check_dependencies
        result.should ==
          '> Check Dependencies'
      end

      it 'formats Merge Swift module' do
        @formatter.format_merge_swift_module(Pathname.new("~/foo/wat.swiftmodule"))
        result.should ==
          '> Merge Swift module wat.swiftmodule'
      end
    end
end

