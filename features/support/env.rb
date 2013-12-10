$:.unshift File.expand_path('../../..', __FILE__)

require "tempfile"
require "spec/fixtures/constants"
require "spec/support/matchers/colors"
require "lib/xcpretty/ansi"

include XCPretty::ANSI

TEST_RUN_START_MATCHER  = /Test Suite .+ started/
TEST_SUITE_COMPLETION_MATCHER = /Executed \d+ tests, with \d+ failures \(\d+ unexpected\) in \d+\.\d+ \(\d+\.\d+\) seconds/
TEST_SUITE_START_MATCHER = /[\w]*(Spec|Tests)$/
TEST_PATH_MATCHER = %r{[\w/\-\s]+:\d+}
PASSING_TEST_NAME_MATCHER = %r{\w+\s\(\d+\.\d+\sseconds\)}
FAILING_TEST_NAME_MATCHER = %r{\w+, expected:}

def run_xcpretty flags
  add_run_input SAMPLE_OCUNIT_SUITE_COMPLETION
  add_run_input SAMPLE_EXECUTED_TESTS
  input_file = Tempfile.new("xcpretty_input")
  File.open(input_file.path, 'w') do |file|
    file.print run_input
  end
  @output = %x(cat '#{input_file.path}' | bin/xcpretty #{flags})
  input_file.unlink
end

def add_run_input text
  run_input << "\n#{text}"
end

def run_input
  @input ||= ""
end

def run_output
  @output ||= ""
end

After do
  @input  = ""
  @output = ""
end
