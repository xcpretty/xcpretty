$:.unshift File.expand_path('../../..', __FILE__)

require "tempfile"
require "spec/fixtures/constants.rb"

INPUT_FILE  = "xcpretty_input"
RED_START   = "\e[31m"
COLOR_END   = "\e[0m"
GREEN_START = "\e[32;1m"

def run_xcpretty flags
  add_run_input SAMPLE_EXECUTED_TESTS
  add_run_input SAMPLE_KIWI_SUITE_COMPLETION
  input_file = Tempfile.new(INPUT_FILE)
  File.write(input_file.path, run_input)
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