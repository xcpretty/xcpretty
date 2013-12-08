require "paint"

module XCPretty
	module Printer
		attr_accessor :colorize

		FAILURE_MATCHER = /(.+:\d+):\serror:\s[\+\-]\[(.*)\]\s:(?:\s'.*'\s\[FAILED\],)?\s(.*)/

		Paint::SHORTCUTS[:printer] = {
		  :white => Paint.color(:bold),
		  :red   => Paint.color(:red),
		  :green => Paint.color(:green, :bright),
		  :link  => Paint.color(:cyan),
		}

		include Paint::Printer

		def pretty_print(text)
			if text =~ FAILURE_MATCHER
				store_failure($1, $2, $3)
			end
      formatted_text = pretty_format(text)
      STDOUT.print(formatted_text + pretty_prefix) unless formatted_text.empty?
    end

    def pretty_prefix
      ""
    end

    def project_build_info(text)
      target = text.split('TARGET').last.split('OF PROJECT').first
      clean_target = target.split('-').last.strip
      project = text.split('OF PROJECT').last.split('WITH').first.strip
      configuration = text.split('CONFIGURATION').last.split('===').first.strip
      {
        :target => clean_target,
        :project => project,
        :configuration => configuration
      }
    end

    def failures
      @failures ||= []
    end

		def store_failure(file, test_case, failure_message)
      failures << {
        file: file,
        test_case: test_case,
        failure_message: failure_message
      }
    end

    def colorize?
    	!!@colorize
    end
	end
end
