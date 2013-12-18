require "xcpretty/version"
require "xcpretty/printer"
require "xcpretty/formatters/formatter"
require "xcpretty/formatters/simple"
require "xcpretty/formatters/rspec"
require "xcpretty/reporters/junit"

module XCPretty
  class ExitStatus

    include XCPretty::Matchers

    def self.code
      $exit_status || 0
    end

    def self.handle(text)
      $exit_status = 1 if text =~ FAILING_TEST_MATCHER || text =~ /FAILED \*\*/
    end

  end
end
