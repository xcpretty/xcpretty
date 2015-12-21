module XCPretty

module ReporterMethods
	EMPTY = ''.freeze
	def handle(line);						EMPTY; end
	def finish;									EMPTY; end
	def write_report_file; 			EMPTY; end
	def initialize(options);		EMPTY; end
	def handle(line); 					EMPTY; end
end

	class Reporter < Formatter

		def initialize(options)
	    @parser = Parser.new(self)
	    @filepath  = options[:path] || FILEPATH
	    @total_tests = 0
	    @total_fails = 0
	    @test_suites = {}
	  end

	  def handle(line)
      @parser.parse(line)
    end

	  def finish
      FileUtils.mkdir_p(File.dirname(@filepath))
      write_report
    end

		def format_failing_test(suite, test_case, reason, file)
			data = (name: test_case, failing: true,
                      reason: reason, file: file,
                      snippet: formatted_snippet(file))
      @test_count += 1
      @fail_count += 1
      @test_suites[suite] ||= {tests: []}
      @test_suites[suite][:tests] << data
    end

    def format_passing_test(suite, test_case, time)
      data = (name: test_case, time: time)
      @test_count += 1
      @test_suites[suite] ||= {tests: []}
      @test_suites[suite][:tests] << data
    end

    def format_pending_test(classname, test_case)
      data = (name: test_case, time: time, pending: true)
      @test_count += 1
      @test_suites[suite] ||= {tests: []}
      @test_suites[suite][:tests] << data
    end    

    def write_report
      File.open(@filepath, 'w') do |f|
        # WAT: get rid of these locals. BTW Cucumber fails if you remove them
        test_suites = @test_suites
        fail_count  = @fail_count
        test_count  = @test_count
        erb = ERB.new(File.open(TEMPLATE, 'r').read)
        f.write erb.result(binding)
      end
    end

	end

end