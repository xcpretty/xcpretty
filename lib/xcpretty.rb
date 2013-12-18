require "xcpretty/version"
require "xcpretty/printer"
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
      POSSIBLE_FAILURES.each do |failure|
        $exit_status = 1 and return if text =~ failure
      end
    end

  end
end
