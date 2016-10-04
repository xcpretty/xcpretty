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

  it 'parses CompileC' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @formatter.flush.should == [
      :format_compile,
      Pathname.new("/Users/musalj/code/OSS/Objective\\ Sugar/Classes/NSMutableArray+ObjectiveSugar.m")]
  end

  it 'parses CompileSwift' do
    @parser.parse(SAMPLE_SWIFT_COMPILE.lines[1])
    @formatter.flush.should == [
      :format_compile,
      Pathname.new("/Users/marinusalj/code/foo/bar-temp/baz/Classes/yolo\\ +\\ Common/Common/Helpers\\ \\&\\ Managers/Poller.swift")]
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

    it 'shuts up `export`' do
      suppress(/^\s{4}export/, [
        SAMPLE_COMPILE, SAMPLE_COMPILE_SWIFT_SOURCES, SAMPLE_PROCESS_INFOPLIST,
        SAMPLE_DITTO, SAMPLE_TOUCH, SAMPLE_NEW_RUN_SCRIPT, SAMPLE_LD, SAMPLE_CPHEADER])
    end

    it 'suppresses mkdir' do
      suppress(/^\/bin\/mkdir/, [
        SAMPLE_WRITE_AUXILIARY_FILES,
        SAMPLE_CREATE_PRODUCT_STRUCTURE
      ])
    end

    it 'shuts up `cd`' do
      suppress(/^\s{4}cd/, [
        SAMPLE_COMPILE, SAMPLE_SWIFT_COMPILE, SAMPLE_COMPILE_SWIFT_SOURCES,
        SAMPLE_PROCESS_INFOPLIST, SAMPLE_DITTO, SAMPLE_TOUCH,
        SAMPLE_PHASE_SCRIPT_EXECUTION_FAIL, SAMPLE_LD, SAMPLE_CPHEADER])
    end

    it 'suppresses builtin-' do
      suppress(/^\s{4}builtin-/, [SAMPLE_PROCESS_INFOPLIST, SAMPLE_DITTO, SAMPLE_CPHEADER])
    end

    it 'shuts up setenv' do
      suppress(/^\s{4}setenv/, [SAMPLE_COMPILE])
    end

    it 'suppresses /usr/bin/ditto invocation' do
      suppress(/^\s{4}\/usr\/bin\/ditto/, [SAMPLE_DITTO])
    end

    it 'suppresses chmod invocation' do
      suppress(/^chmod/,[SAMPLE_WRITE_AUXILIARY_FILES])
    end

    it 'suppresses shell invocations' do
      suppress(/^\s{4}\/bin\/sh -c/, [SAMPLE_PHASE_SCRIPT_EXECUTION_FAIL])
    end

    it 'suppresses touch invocation' do
      suppress(/^\s{4}\/usr\/bin\/touch -c/,[SAMPLE_TOUCH])
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

  it 'parses Touch' do
    @parser.parse(SAMPLE_TOUCH.lines[1])
    @formatter.flush.should == [:format_touch, Pathname.new("/Users/musalj/Library/Developer/Xcode/DerivedData/Alcatraz-aobuxcinaqyzjugrnxjjhfzgwaou/Build/Products/Debug/Alcatraz\\ Tests.octest")]
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
      Pathname.new("/Users/musalj/code/OSS/Objective\\ Sugar/Classes/NSMutableArray+ObjectiveSugar.m")]
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

  it 'parses create project structure' do
    @parser.parse(SAMPLE_CREATE_PRODUCT_STRUCTURE.lines[1])
    @formatter.flush.should == [:format_create_product_structure]
  end

  it 'parses process info.plist' do
    @parser.parse(SAMPLE_PROCESS_INFOPLIST.lines[1])
    @formatter.flush.should == [
      :format_process_info_plist,
      Pathname.new("Target\\ Support\\ Files/LambdaKit-iOS/Info.plist")
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

  it 'parses cpheader' do
    @parser.parse(SAMPLE_CPHEADER.lines[1])
    @formatter.flush.should == [
      :format_copy_header_file,
      Pathname.new("Target\\ Support\\ Files/Alamofire/Alamofire-umbrella.h"),
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Alamofire.framework/Headers/Alamofire-umbrella.h")
    ]
  end
end
end #XCPretty
