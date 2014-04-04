$:.unshift File.expand_path('../../..', __FILE__)

require 'tempfile'
require 'spec/fixtures/constants'
require 'spec/support/matchers/colors'
require 'lib/xcpretty/ansi'
require 'lib/xcpretty/version'
require 'lib/xcpretty/syntax'
require 'rexml/document'
require 'lib/xcpretty/formatters/formatter'
require 'lib/xcpretty/reporters/junit'
require 'lib/xcpretty/reporters/html'
require 'lib/xcpretty/reporters/json_compilation_database'
begin
  require 'json'
rescue LoadError
  require 'vendor/json_pure/parser'
end

include XCPretty::ANSI

TEST_RUN_START_MATCHER  = /Test Suite .+ started/
TEST_SUITE_COMPLETION_MATCHER = /Executed \d+ tests, with \d+ failures \(\d+ unexpected\) in \d+\.\d+ \(\d+\.\d+\) seconds/
TEST_SUITE_START_MATCHER = /[\w]*(Spec|Tests)$/
TEST_PATH_MATCHER = %r{[\w/\-\s]+:\d+}
PASSING_TEST_NAME_MATCHER = %r{\w+\s\(\d+\.\d+\sseconds\)}
PENDING_TEST_NAME_MATCHER = %r{\w+\s\[PENDING\]}
FAILING_TEST_NAME_MATCHER = %r{\w+, expected:}

JSON_DB_FIXTURE_COMMAND_COUNT = 557

def run_xcpretty(flags)
  input_file = Tempfile.new('xcpretty_input')
  File.open(input_file.path, 'w') do |file|
    file.print run_input
  end
  @output = %x(cat '#{input_file.path}' | bin/xcpretty #{flags})
  input_file.unlink
end

def add_run_input(text)
  run_input << "\n#{text}"
end

def run_input
  @input ||= ''
end

def run_output
  @output ||= ''
end

def html_report
  @html_report ||= REXML::Document.new(File.open(XCPretty::HTML::FILEPATH, 'r').read.sub("<!DOCTYPE html>",""))
end

def html_report_body
  html_report.root.get_elements('//body').first
end

def html_test_suites
  parent = html_report_body.get_elements("//*[@id='test-suites']/").first
  parent.elements.to_a.select do |e|
    e.attributes['class'] && e.attributes['class'].include?('test-suite')
  end
end

def json_db
  @json ||= JSON.parse(File.open(custom_report_path, 'r').read)
end

def junit_report
  REXML::Document.new(File.open(XCPretty::JUnit::FILEPATH, 'r').read)
end

def junit_report_root
  junit_report.root.elements.to_a.first
end

def custom_report_path
  @custom_report_path ||= begin
    @custom_report_file1 = Tempfile.new('custom_report_path')
    @custom_report_file1.path
  end
end

def other_custom_report_path
  @custom_report_path2 ||= begin
    @custom_report_file2 = Tempfile.new('custom_report_path')
    @custom_report_file2.path
  end
end

Before do
  self.colorize = true
end

After do
  @input  = ""
  @output = ""
  @custom_report_file1.unlink if @custom_report_file1
  @custom_report_file2.unlink if @custom_report_file2
  @html_report = nil
  @json = nil
  FileUtils.rm_rf(XCPretty::JUnit::FILEPATH)
  FileUtils.rm_rf(XCPretty::HTML::FILEPATH)
  FileUtils.rm_rf(XCPretty::JSONCompilationDatabase::FILEPATH)
end
