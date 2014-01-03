require "xcpretty/version"
require "xcpretty/printer"
require "xcpretty/syntax"
require "xcpretty/formatters/formatter"
require "xcpretty/formatters/simple"
require "xcpretty/formatters/rspec"
require "xcpretty/reporters/junit"

module XCPretty
  class ExitStatus

    include XCPretty::Matchers

    POSSIBLE_FAILURES = [
      FAILING_TEST_MATCHER,
      /\serror:\s/
    ]

    def self.code
      $exit_status || 0
    end

    def self.handle(text)
      POSSIBLE_FAILURES.detect do |failure|
        $exit_status = 1 if text =~ failure
      end
    end

  end

  class Runner

    def self.class_from_path(path)
      source = File.read(path)
      klass = eval(source, nil, path)
      raise unless klass.is_a?(Class)
      klass
    end

    def self.load_custom_formatter(path)
      begin
        $:.unshift File.dirname(path)
        class_from_path(path)
      rescue SyntaxError => e
        exit_with_error("Expected formatter source file to return a class. #{e}")
      end
    end

    def self.exit_with_error(message)
      $stderr.puts "[!] #{message}"
      exit 1
    end
  end
end

