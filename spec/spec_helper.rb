$LOAD_PATH.unshift('.', __FILE__)
require "lib/xcpretty/ansi"
require "support/matchers/colors"
require "fixtures/constants"

include XCPretty::ANSI

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
  config.mock_with :rspec do |c|
    c.syntax = :should
  end
end
