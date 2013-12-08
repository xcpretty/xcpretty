module XCPretty
	module Printer
		attr_accessor :colorize

		FAILURE_MATCHER = /(.+:\d+):\serror:\s[\+\-].*\s:\s'(.*)'\s\[FAILED\],\s(.*)/

		def store_failure(file, test_case, failure_message)
      failures << {
        file: file,
        test_case: test_case,
        failure_message: failure_message
      }
    end
	end
end