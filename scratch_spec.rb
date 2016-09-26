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

  it 'handles CompileSwiftSources' do
    @parser.parse(SAMPLE_COMPILE_SWIFT_SOURCES.lines[1])
    @formatter.flush.should == [:format_compile_swift_sources]
  end

  it 'supresses the giant compiler (swift, swiftc, clang) output' do
    [SAMPLE_COMPILE, SAMPLE_SWIFT_COMPILE, SAMPLE_COMPILE_SWIFT_SOURCES].each do |source|
      @parser.parse(source.lines[1])
      @formatter.flush
      @parser.parse(source.lines.select { |l| l =~ /^    \/Applications/}[0])
      @formatter.flush.should == []
      @parser.parse("\n")
    end
  end

  it 'handles MergeSwiftModule' do
    @parser.parse(SAMPLE_MERGE_SWIFT_MODULE.lines[1])
    @formatter.flush.should == [
      :format_merge_swift_module,
      Pathname.new("/Users/marinusalj/code/lyft/lyft-temp/build/Pods.build/Debug-iphonesimulator/SnapKit.build/Objects-normal/x86_64/SnapKit.swiftmodule")]
  end

  it 'shuts up `export` in compile body' do
    [SAMPLE_COMPILE, SAMPLE_COMPILE_SWIFT_SOURCES].each do |source|
      @parser.parse(source.lines[1])
      @formatter.flush
      @parser.parse(source.lines.select { |l| l =~ /^    export/}[0])
      @formatter.flush.should == []
      @parser.parse("\n")
    end
  end

  it 'shuts up `cd` in compile body' do
    [SAMPLE_COMPILE, SAMPLE_SWIFT_COMPILE, SAMPLE_COMPILE_SWIFT_SOURCES].each do |source|
      @parser.parse(source.lines[1])
      @formatter.flush
      @parser.parse(SAMPLE_COMPILE_SWIFT_SOURCES.lines[2])
      @formatter.flush.should == []
      @parser.parse("\n")
    end
  end

  it 'shuts up setenv' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @formatter.flush
    SAMPLE_COMPILE.lines.select { |l| l =~ /^    setenv/}.each do |line|
      @parser.parse(line)
      @formatter.flush.should == []
    end
  end

  it 'outputs unrecognized text' do
    @parser.parse(SAMPLE_COMPILE.lines[1])
    @parser.parse("YOLO 123")
    @formatter.flush.should == [:format_unknown, "YOLO 123"]
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

end

