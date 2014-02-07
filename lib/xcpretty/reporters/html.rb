module XCPretty
  class HTML

    include XCPretty::FormatMethods
    FILEPATH = 'build/reports/tests.html'
    TEMPLATE = File.expand_path('../../../../assets/report.html.erb', __FILE__)

    def load_dependencies
      unless @@loaded ||= false
        require 'fileutils'
        require 'pathname'
        require 'erb'
        @@loaded = true
      end
    end

    def initialize(options)
      load_dependencies
      @test_suites = {}
      @filepath    = options[:path] || FILEPATH
      @parser      = Parser.new(self)
      @test_count  = 0
      @fail_count  = 0
    end

    def handle(line)
      @parser.parse(line)
    end

    def format_failing_test(suite, test_case, reason, file)
      add_test(suite, {:name => test_case, :failing => true})
    end

    def format_passing_test(suite, test_case, time)
      add_test(suite, {:name => test_case, :time => time})
    end

    def finish
      FileUtils.mkdir_p(File.dirname(@filepath))
      write_report
    end

    private

    def add_test(suite_name, data)
      @test_count += 1
      @test_suites[suite_name] ||= {:tests => []}
      @test_suites[suite_name][:tests] << data
      if data[:failing]
        @test_suites[suite_name][:failing] = true
        @fail_count += 1
      end
    end

    def write_report
      File.open(@filepath, 'w') do |f|
        test_suites = @test_suites
        fail_count  = @fail_count
        test_count  = @test_count
        erb = ERB.new(File.open(TEMPLATE, 'r').read)
        f.write erb.result(binding)
      end
    end
  end
end