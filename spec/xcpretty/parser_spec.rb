require 'xcpretty'
require 'xcpretty/parser'
require 'fixtures/constants'
require 'spec_helper'

module XCPretty

class MockFormatter
  def method_missing(*args)
    @args = args
  end

  def flush
    a = @args
    @args = []
    a
  end
end

describe 'Parser' do
  before do
    @formatter = MockFormatter.new
    @parser = Parser.new(@formatter)
  end

  it 'knows what makes a path' do
    path = "/tmp/supermarin/lost\\ \\&\\ found/a\\ +\\ b/e@mail/foo.bar/\\ 123_4"
    "#{path} word".match(/(#{PATH})/)[1].should == path
  end

  it 'handles unescaped compileswift paths' do
    path = "/foo/bar + baz/yolo"
    path.match(/(#{UNESCAPED_PATH})/)[1].should == path
  end

  it 'parses CompileSwift with whole module optimization from a file list' do
    path = "/tmp/folders/jm/fw86rxds0xn69sk40d18y69m0000gp/T/sources-43ef26"
    FileUtils.mkdir_p(File.dirname(path))

    File.write(path, "/foo/bar/baz.swift\n/bar/bang/f.swift\n")
    @parser.parse(SAMPLE_COMPILE_SWIFT_WITH_OPTIMIZATION_WITH_FILE_LIST.lines[1])
    @parser.parse(SAMPLE_COMPILE_SWIFT_WITH_OPTIMIZATION_WITH_FILE_LIST.lines[3])
    @formatter.flush.should == [
      :format_compile_swift_with_module_optimization,
      [
        Pathname.new("/foo/bar/baz.swift"),
        Pathname.new("/bar/bang/f.swift")
      ]
    ]
    FileUtils.rm(path)
  end

  it "doesn't crash if the -filelist file is not there" do
    lambda {
      @parser.parse(SAMPLE_COMPILE_SWIFT_WITH_OPTIMIZATION_WITH_FILE_LIST.lines[1])
      @parser.parse(SAMPLE_COMPILE_SWIFT_WITH_OPTIMIZATION_WITH_FILE_LIST.lines[3])
    }.should_not raise_error
  end


  it 'parses CompileSwift with whole module optimization' do
    @parser.parse(SAMPLE_SWIFT_COMPILE_WITH_MODULE_OPTIMIZATION.lines[1])
    @parser.parse(SAMPLE_SWIFT_COMPILE_WITH_MODULE_OPTIMIZATION.lines[4])
    @formatter.flush.should == [
      :format_compile_swift_with_module_optimization,
      [
        Pathname.new("/a/b/Lyft/API/Passenger/LyftAPI+EditPartySize.swift"),
        Pathname.new("/a/b/Lyft/API/Passenger/LyftAPI+Payments.swift"),
        Pathname.new("/a/b/Lyft/API/Passenger/RideHistoryRoute.swift"),
        Pathname.new("/a/b/Lyft/API/Common/LyftAPI+Location.swift")
      ]
    ]
  end

  it 'parses CompileC' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @formatter.flush.should == [
      :format_compile,
      Pathname.new("/Users/musalj/code/OSS/Objective\ Sugar/Classes/NSMutableArray+ObjectiveSugar.m")]
  end

  it 'parses CompileSwift' do
    @parser.parse(SAMPLE_SWIFT_COMPILE.lines[1])
    @formatter.flush.should == [
      :format_compile,
      Pathname.new("/Users/marinusalj/code/foo/bar-temp/baz/Classes/yolo\ +\ Common/Common/Helpers\ \&\ Managers/Poller.swift")]
  end

  it 'parses Ditto' do
    @parser.parse(SAMPLE_DITTO.lines[1])
    @formatter.flush.should == [
      :format_ditto,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit-Swift.h")]
  end

  it 'parses CompileSwiftSources' do
    @parser.parse(SAMPLE_COMPILE_SWIFT_SOURCES.lines[1])
    @formatter.flush.should == [:format_compile_swift_sources]
  end

  context 'Suppressing' do

    def suppress(regex, chunks)
      chunks.each do |chunk|
        @parser.parse(chunk.lines[1])
        @formatter.flush
        @parser.parse(chunk.lines.find { |l| l =~ regex })
        @formatter.flush.should == []
        @parser.parse("\n")
      end
    end

    it 'supresses the giant compiler (swift, swiftc, clang) output' do
      suppress(/^\s{4}\/Applications/, [
        SAMPLE_COMPILE, SAMPLE_SWIFT_COMPILE,
        SAMPLE_COMPILE_SWIFT_SOURCES, SAMPLE_LD])
    end

    it 'suppresses mkdir' do
      suppress(/^\/bin\/mkdir/, [
        SAMPLE_WRITE_AUXILIARY_FILES,
        SAMPLE_CREATE_PRODUCT_STRUCTURE
      ])
    end

    it 'shuts up `export`' do
      suppress(/^\s{4}export/, [
        SAMPLE_COMPILE,
        SAMPLE_SWIFT_COMPILE_WITH_MODULE_OPTIMIZATION,
        SAMPLE_COMPILE_SWIFT_SOURCES, SAMPLE_PROCESS_INFOPLIST, SAMPLE_DITTO,
        SAMPLE_TOUCH, SAMPLE_NEW_RUN_SCRIPT, SAMPLE_LD, SAMPLE_CPHEADER,
        SAMPLE_CPRESOURCE, SAMPLE_COMPILE_XIB, SAMPLE_LIBTOOL,
        SAMPLE_COPYSWIFTLIBS, SAMPLE_COMPILE_ASSET_CATALOG,
        SAMPLE_COMPILE_STORYBOARD, SAMPLE_COPYPNGFILE, SAMPLE_CODESIGN,
        SAMPLE_COPYSTRINGS, SAMPLE_LINK_STORYBOARDS, SAMPLE_PBXCP,
        SAMPLE_CREATE_UNIVERSAL_BINARY, SAMPLE_GENERATE_DSYM, SAMPLE_SYMLINK,
        SAMPLE_SWIFT_CODE_GENERATION, SAMPLE_STRIP])
    end

    it 'shuts up `cd`' do
      suppress(/^\s{4}cd/, [
        SAMPLE_COMPILE, SAMPLE_SWIFT_COMPILE,
        SAMPLE_SWIFT_COMPILE_WITH_MODULE_OPTIMIZATION,
        SAMPLE_COMPILE_SWIFT_SOURCES, SAMPLE_PROCESS_INFOPLIST, SAMPLE_DITTO,
        SAMPLE_TOUCH, SAMPLE_PHASE_SCRIPT_EXECUTION_FAIL, SAMPLE_LD,
        SAMPLE_CPHEADER, SAMPLE_CPRESOURCE, SAMPLE_COMPILE_XIB, SAMPLE_LIBTOOL,
        SAMPLE_COPYSWIFTLIBS, SAMPLE_COMPILE_ASSET_CATALOG,
        SAMPLE_COMPILE_STORYBOARD, SAMPLE_COPYPNGFILE, SAMPLE_COPYSTRINGS,
        SAMPLE_LINK_STORYBOARDS, SAMPLE_PBXCP, SAMPLE_CREATE_UNIVERSAL_BINARY,
        SAMPLE_GENERATE_DSYM, SAMPLE_SYMLINK, SAMPLE_SWIFT_CODE_GENERATION,
        SAMPLE_STRIP])
    end

    it 'suppresses builtin-' do
      suppress(/^\s{4}builtin-/, [
        SAMPLE_PROCESS_INFOPLIST, SAMPLE_DITTO, SAMPLE_CPHEADER,
        SAMPLE_CPRESOURCE, SAMPLE_COPYSTRINGS, SAMPLE_PBXCP])
    end

    it 'shuts up setenv' do
      suppress(/^\s{4}setenv/, [SAMPLE_COMPILE])
    end

    it 'suppresses /usr/bin/ditto invocation' do
      suppress(/^\s{4}\/usr\/bin\/ditto/, [SAMPLE_DITTO])
    end

    it 'suppresses chmod invocation' do
      suppress(/^chmod/, [SAMPLE_WRITE_AUXILIARY_FILES])
    end

    it 'suppresses shell invocations' do
      suppress(/^\s{4}\/bin\/sh -c/, [SAMPLE_PHASE_SCRIPT_EXECUTION_FAIL])
    end

    it 'suppresses touch invocation' do
      suppress(/^\s{4}\/usr\/bin\/touch -c/, [SAMPLE_TOUCH])
    end

    it 'suppresses ibtool invocation' do
      suppress(/^\s{4}(?:#{PATH})ibtool /,
               [SAMPLE_COMPILE_XIB, SAMPLE_COMPILE_STORYBOARD,
                SAMPLE_LINK_STORYBOARDS])
    end

    it 'suppresses libtool invocation' do
      suppress(/^\s{4}(?:#{PATH})libtool /, [SAMPLE_LIBTOOL])
    end

    it 'suppresses swift-stdlib-tool' do
      suppress(/^\s{4}(?:#{PATH})swift-stdlib-tool /, [SAMPLE_COPYSWIFTLIBS])
      suppress(/^\s{4}builtin-swiftStdLibTool /, [SAMPLE_COPYSWIFTLIBS])
    end

    it 'suppresses actool' do
      suppress(/^\s{4}(?:#{PATH})actool /, [SAMPLE_COMPILE_ASSET_CATALOG])
      suppress(/^#{PATH}$/, [SAMPLE_COMPILE_ASSET_CATALOG])
      suppress(/\* com\.apple\.actool\.compilation-results \*/,
               [SAMPLE_COMPILE_ASSET_CATALOG])
    end

    it 'suppresses codesign tool' do
      suppress(/^\s{2}\/usr\/bin\/codesign /, [SAMPLE_COPYSWIFTLIBS])
    end

  end

  context 'Simplifying' do
    it 'simplifies "Code signature of ... is unchanged"' do
      @parser.parse(SAMPLE_COPYSWIFTLIBS.lines[1])
      @parser.parse(SAMPLE_COPYSWIFTLIBS.lines.find { |l| l =~ /^Code signature of/ })
      @formatter.flush.should == [
        :format_code_signature_unchanged,
        Pathname.new("/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib")
      ]
    end
  end

  it 'outputs unrecognized text' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @parser.parse("YOLO 123")
    @formatter.flush.should == [:format_unknown, "YOLO 123"]
  end

  it 'parses MergeSwiftModule' do
    @parser.parse(SAMPLE_MERGE_SWIFT_MODULE.lines[1])
    @formatter.flush.should == [
      :format_merge_swift_module,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit.swiftmodule")]
  end

  it 'parses swift code generation' do
    @parser.parse(SAMPLE_SWIFT_CODE_GENERATION.lines[1])
    @formatter.flush.should == [
      :format_swift_code_generation,
      Pathname.new("/a/b/build/Build/Intermediates/ArchiveIntermediates/Lyft/IntermediateBuildFilesPath/Pods.build/Beta-iphoneos/SnapKit.build/Objects-normal/arm64/ConstraintMakerPriortizable.bc")
    ]
  end

  it 'parses Strip' do
    @parser.parse(SAMPLE_STRIP.lines[1])
    @formatter.flush.should == [
      :format_strip,
      Pathname.new("/a/b/build/Build/Intermediates/ArchiveIntermediates/Lyft/IntermediateBuildFilesPath/UninstalledProducts/iphoneos/libPhoneNumber_iOS.framework/libPhoneNumber_iOS")
    ]
  end

  it 'parses Touch' do
    @parser.parse(SAMPLE_TOUCH.lines[1])
    @formatter.flush.should == [:format_touch, Pathname.new("/Users/musalj/Library/Developer/Xcode/DerivedData/Alcatraz-aobuxcinaqyzjugrnxjjhfzgwaou/Build/Products/Debug/Alcatraz\ Tests.octest")]
  end

  it 'parses writing auxiliary files' do
    @parser.parse(SAMPLE_WRITE_AUXILIARY_FILES.lines[1])
    @formatter.flush.should == [:format_write_auxiliary_files]
  end

  it 'parses write-file' do
    @parser.parse(SAMPLE_WRITE_AUXILIARY_FILES.lines[1])
    @parser.parse(SAMPLE_WRITE_AUXILIARY_FILES.lines[2])
    @formatter.flush.should == [:format_write_file, Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Lyft.build/Debug-iphonesimulator/WatchModels.build/Script-49C486D7B8EF179A4C22BBA8.sh")]
  end

  it 'recovers after printing unrecognized text' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @parser.parse("YOLO 123")
    @parser.parse("\n")
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @formatter.flush.should == [
      :format_compile,
      Pathname.new("/Users/musalj/code/OSS/Objective\ Sugar/Classes/NSMutableArray+ObjectiveSugar.m")]
  end

  it 'doesnt switch chunks before finishing' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @parser.parse(SAMPLE_CODESIGN.lines[1])
    @formatter.flush.should == [:format_unknown, "CodeSign build/Release/CocoaChip.app"]
  end

  it 'recognizes codesign' do
    @parser.parse(SAMPLE_CODESIGN.lines[1])
    @formatter.flush.should == [:format_codesign, Pathname.new("build/Release/CocoaChip.app")]
  end

  it 'knows how to exit' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @parser.parse("\n")
    @parser.parse(SAMPLE_CODESIGN.lines[1])
    @formatter.flush.should == [:format_codesign, Pathname.new("build/Release/CocoaChip.app")]
  end

  it 'exits only if the line is empty' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @parser.parse("yolo\n")
    @formatter.flush.should == [:format_unknown, "yolo"]
  end

  it 'prints unrecognized text if there is no chunk' do
    @parser.parse("YOLO")
    @formatter.flush.should == [:format_unknown, "YOLO"]
  end

  it 'parses SymLink' do
    @parser.parse(SAMPLE_SYMLINK.lines[1])
    @formatter.flush.should == [
      :format_symlink,
      Pathname.new("/a/b/build/Build/Intermediates/ArchiveIntermediates/Lyft/BuildProductsPath/Beta-iphoneos/libPhoneNumber-iOS/libPhoneNumber_iOS.framework"),
      Pathname.new("/a/b/build/Build/Intermediates/ArchiveIntermediates/Lyft/IntermediateBuildFilesPath/UninstalledProducts/iphoneos/libPhoneNumber_iOS.framework")
    ]
  end

  it 'parses create project structure' do
    @parser.parse(SAMPLE_CREATE_PRODUCT_STRUCTURE.lines[1])
    @formatter.flush.should == [:format_create_product_structure]
  end

  it 'parses process info.plist' do
    @parser.parse(SAMPLE_PROCESS_INFOPLIST.lines[1])
    @formatter.flush.should == [
      :format_process_info_plist,
      Pathname.new("Target\ Support\ Files/LambdaKit-iOS/Info.plist")
    ]
  end

  it 'check dependencies' do
    @parser.parse('Check dependencies')
    @formatter.flush.should == [:format_check_dependencies]
  end

  it 'parses phase script execution' do
    @parser.parse(SAMPLE_PHASE_SCRIPT_EXECUTION_FAIL.lines[1])
    @formatter.flush.should == [
      :format_phase_script_execution,
      "[CP] Check Pods Manifest.lock"
    ]
  end

  it 'parses Ld' do
    @parser.parse(SAMPLE_LD.lines[1])
    @formatter.flush.should == [
      :format_ld,
      Pathname.new("/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/ObjectiveSugar"),
      'normal',
      'i386'
    ]
  end

  it 'parses CpHeader' do
    @parser.parse(SAMPLE_CPHEADER.lines[1])
    @formatter.flush.should == [
      :format_copy_header_file,
      Pathname.new("Target\ Support\ Files/Alamofire/Alamofire-umbrella.h"),
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Alamofire.framework/Headers/Alamofire-umbrella.h")
    ]
  end

  it 'parses GenerateDSYMFile' do
    @parser.parse(SAMPLE_GENERATE_DSYM.lines[1])
    @formatter.flush.should == [
      :format_generate_dsym,
      Pathname.new("/a/b/build/Build/Products/QA-iphonesimulator/FBSDKLoginKit/FBSDKLoginKit.framework.dSYM")
    ]
  end

  it 'parses CpResource' do
    @parser.parse(SAMPLE_CPRESOURCE.lines[1])
    @formatter.flush.should == [
      :format_cpresource,
      Pathname.new("ObjectiveSugar/Default-568h@2x.png"),
      Pathname.new("/Users/musalj/Library/Developer/Xcode/DerivedData/ObjectiveSugar-ayzdhqmmwtqgysdpznmovjlupqjy/Build/Products/Debug-iphonesimulator/ObjectiveSugar.app/Default-568h@2x.png")
    ]
  end

  it 'parses CopyPNGFile' do
    @parser.parse(SAMPLE_COPYPNGFILE.lines[1])
    @formatter.flush.should == [
      :format_copy_png_file,
      Pathname.new("Default-568h@2x.png"),
      Pathname.new("build/Example.app/Default-568h@2x.png")
    ]
  end

  it 'parses CopySwiftLibs' do
    @parser.parse(SAMPLE_COPYSWIFTLIBS.lines[1])
    @formatter.flush.should == [
      :format_copy_swift_libs,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods_Lyft.framework")
    ]
  end

  it 'parses CopyStringsFile' do
    @parser.parse(SAMPLE_COPYSTRINGS.lines[1])
    @formatter.flush.should == [
      :format_copy_strings_file,
      Pathname.new("Lyft/Models/Resources/en.lproj/Localizable.strings")
    ]
  end

  it 'parses Codesigning swift libs' do
    @parser.parse(SAMPLE_COPYSWIFTLIBS.lines[1])
    @parser.parse(SAMPLE_COPYSWIFTLIBS.lines.find { |l| l =~ /^Codesigning/ })
    @formatter.flush.should == [
      :format_codesigning_swift_lib,
      Pathname.new("/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib")
    ]
  end

  it 'parses Probing swift libs' do
    @parser.parse(SAMPLE_COPYSWIFTLIBS.lines[1])
    @parser.parse(SAMPLE_COPYSWIFTLIBS.lines.find { |l| l =~ /^Probing/ })
    @formatter.flush.should == [
      :format_probing_swift_lib,
      Pathname.new("/Users/marinusalj/code/yolo/yolo-ios/build/Products/Debug-iphonesimulator/yolo.app/Frameworks/libswiftCore.dylib")
    ]
  end

  it 'parses CompileXIB' do
    @parser.parse(SAMPLE_COMPILE_XIB.lines[1])
    @formatter.flush.should == [
      :format_compile_xib,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/LyftKit/Resources/LyftUI/XIBs/AlertController.xib")
    ]
  end

  it 'parses CompileStoryboard' do
    @parser.parse(SAMPLE_COMPILE_STORYBOARD.lines[1])
    @formatter.flush.should == [
      :format_compile_storyboard,
      Pathname.new("Lyft/Resources/Storyboards\ &\ XIBs/Driver/DriverDestination.storyboard")
    ]
  end

  it 'parses CreateUniversalBinary' do
    @parser.parse(SAMPLE_CREATE_UNIVERSAL_BINARY.lines[1])
    @formatter.flush.should == [
      :format_create_universal_binary,
      Pathname.new("/a/b/build/Build/Products/QA-iphonesimulator/FBSDKLoginKit/FBSDKLoginKit.framework/FBSDKLoginKit")
    ]
  end
  it 'parses LinkStoryboards' do
    @parser.parse(SAMPLE_LINK_STORYBOARDS.lines[1])
    @formatter.flush.should == [:format_link_storyboards]
  end

  it 'parses Libtool' do
    @parser.parse(SAMPLE_LIBTOOL.lines[1])
    @formatter.flush.should == [
      :format_libtool,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods_Models.framework/Pods_Models")
    ]
  end

  it 'parses CompileAssetCatalog' do
    @parser.parse(SAMPLE_COMPILE_ASSET_CATALOG)
    @formatter.flush.should == [
      :format_compile_asset_catalog,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/LyftKit/Resources/LyftUI/Images.xcassets")
    ]
  end

  it 'parses PBXCp' do
    @parser.parse(SAMPLE_PBXCP)
    @formatter.flush.should == [
      :format_pbxcp,
      Pathname.new("build/Products/Debug-watchsimulator/API.framework")
    ]
  end

  it 'parses === BUILD target' do
    [SAMPLE_BUILD_TARGET, SAMPLE_BUILD_AGGREGATE_TARGET].each do |target|
      @parser.parse(target)
      @formatter.flush.should ==
        [:format_build_target, 'The Spacer', 'Git app', 'Debug']
      @parser.parse("\n")
    end
  end

  it 'parses === CLEAN target' do
    @parser.parse(SAMPLE_CLEAN_TARGET)
    @formatter.flush.should ==
      [:format_clean_target, 'The Spacer', 'Git app', 'Debug']
  end

  it 'parses === ANALYZE target' do
    @parser.parse(SAMPLE_ANALYZE_TARGET)
    @formatter.flush.should ==
      [:format_analyze_target, 'The Spacer', 'Git app', 'Debug']
  end

end
end # XCPretty
