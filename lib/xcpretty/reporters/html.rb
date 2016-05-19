module XCPretty
  class HTML < Reporter

    FILEPATH = 'build/reports/tests.html'
    TEMPLATE = File.expand_path('../../../../assets/report.html.erb', __FILE__)
    SCREENSHOT_DIR = 'build/reports'

    def load_dependencies
      unless @@loaded ||= false
        require 'fileutils'
        require 'pathname'
        require 'erb'
        @@loaded = true
      end
    end

    def initialize(options)
      super(options)
      @test_suites = {}
      @collect_screenshots = options[:screenshots]
    end

    def handle(line)
      @parser.parse(line)
    end

    def format_failing_test(suite, test_case, reason, file)
      add_test(suite, name: test_case, failing: true,
                      reason: reason, file: file,
                      snippet: formatted_snippet(file))
    end

    def format_passing_test(suite, test_case, time)
      add_test(suite, name: test_case, time: time)
    end

    private

    def formatted_snippet(filepath)
      snippet = Snippet.from_filepath(filepath)
      Syntax.highlight_html(snippet)
    end


    def add_test(suite_name, data)
      @test_count += 1
      @test_suites[suite_name] ||= {tests: [], screenshots: []}
      @test_suites[suite_name][:tests] << data
      if data[:failing]
        @test_suites[suite_name][:failing] = true
        @fail_count += 1
      end
    end

    def write_report
      if @collect_screenshots
        load_screenshots
      end
      File.open(@filepath, 'w') do |f|
        # WAT: get rid of these locals. BTW Cucumber fails if you remove them
        test_suites = @test_suites
        fail_count  = @fail_count
        test_count  = @test_count
        erb = ERB.new(File.open(TEMPLATE, 'r').read)
        f.write erb.result(binding)
      end
    end

    def load_screenshots
      Dir.foreach(SCREENSHOT_DIR) do |item|
        next if item == '.' || item == '..' || File.extname(item) != '.png'

        suite_name = find_test_suite(item)
        next if suite_name.nil?

        @test_suites[suite_name][:screenshots] << item
      end
    end

    def find_test_suite(image_name)
      @test_suites.each do |key, value|
        return key if image_name.start_with?(key)
      end
      nil
    end
  end
end

