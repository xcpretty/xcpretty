require 'pathname'
require_relative 'scratch'
require_relative 'spec/fixtures/constants'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
  config.mock_with :rspec do |c|
    c.syntax = :should
  end
end

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

  it 'handles CompileSwift' do
    @parser.parse(SAMPLE_SWIFT_COMPILE.lines[1])
    @formatter.flush.should == [
      :format_compile,
      Pathname.new("/Users/paul/foo/bar/siesta/Source/Resource.swift")]
  end

  it 'handles Ditto' do
    @parser.parse(SAMPLE_DITTO.lines[1])
    @formatter.flush.should == [
      :format_ditto,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit-Swift.h")]
  end

  it 'handles CompileSwiftSources' do
    @parser.parse(SAMPLE_COMPILE_SWIFT_SOURCES.lines[1])
    @formatter.flush.should == [:format_compile_swift_sources]
  end


  context 'Suppressing' do

    def test_chunks(chunks, regex)
      chunks.each do |chunk|
        @parser.parse(chunk.lines[1])
        @formatter.flush
        @parser.parse(chunk.lines.find { |l| l =~ regex })
        @formatter.flush.should == []
        @parser.parse("\n")
      end
    end

    it 'supresses the giant compiler (swift, swiftc, clang) output' do
      test_chunks(
        [SAMPLE_COMPILE, SAMPLE_SWIFT_COMPILE, SAMPLE_COMPILE_SWIFT_SOURCES],
         /^    \/Applications/)
    end

    it 'shuts up `export` in compile body' do
      test_chunks([SAMPLE_COMPILE, SAMPLE_COMPILE_SWIFT_SOURCES,
         SAMPLE_PROCESS_INFOPLIST, SAMPLE_DITTO],
         /^    export/)
    end

    it 'suppresses mkdir' do
      test_chunks([SAMPLE_WRITE_AUXILIARY_FILES,
                   SAMPLE_CREATE_PRODUCT_STRUCTURE],
                   /^\/bin\/mkdir/)
    end

    it 'shuts up `cd` in compile body' do
      test_chunks(
        [SAMPLE_COMPILE, SAMPLE_SWIFT_COMPILE, SAMPLE_COMPILE_SWIFT_SOURCES,
         SAMPLE_PROCESS_INFOPLIST, SAMPLE_DITTO],
         /^    cd/)
    end

    it 'suppresses builtin-' do
      test_chunks([SAMPLE_PROCESS_INFOPLIST], /^    builtin-/)
    end


    it 'shuts up setenv' do
      test_chunks([SAMPLE_COMPILE], /^    setenv/)
    end

    it 'surpresses /usr/bin/ditto invocation' do
      test_chunks([SAMPLE_DITTO], /^    \/usr\/bin\/ditto/)
    end

    it 'surpresses chmod invocation' do
      test_chunks([SAMPLE_WRITE_AUXILIARY_FILES], /^chmod/)
    end
  end


  it 'outputs unrecognized text' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @parser.parse("YOLO 123")
    @formatter.flush.should == [:format_unknown, "YOLO 123"]
  end

  it 'handles MergeSwiftModule' do
    @parser.parse(SAMPLE_MERGE_SWIFT_MODULE.lines[1])
    @formatter.flush.should == [
      :format_merge_swift_module,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit.swiftmodule")]
  end


  it 'handles writing auxiliary files' do
    @parser.parse(SAMPLE_WRITE_AUXILIARY_FILES.lines[1])
    @formatter.flush.should == [:format_write_auxiliary_files]
  end

  it 'handles write-file' do
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

  it 'handles create project structure' do
    @parser.parse(SAMPLE_CREATE_PRODUCT_STRUCTURE.lines[1])
    @formatter.flush.should == [:format_create_product_structure]
  end

  it 'handles process info.plist' do
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

end

