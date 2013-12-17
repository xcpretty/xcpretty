module XCPretty
  class JUnit
    
    include XCPretty::FormatMethods
    FILEPATH = 'build/reports/junit.xml'

    def load_dependencies
      unless @@loaded ||= false
        require 'fileutils'
        require 'pathname'
        require 'rexml/document'
        require 'rexml/formatters/pretty'
        @@loaded = true
      end
    end

    def initialize
      load_dependencies
      @directory = `pwd`.strip
      @document  = REXML::Document.new
      @parser = Parser.new(self)
    end

    def handle(line)
      @parser.parse(line)
    end

    def format_test_run_started(name)
      @test_count = 0
      @fail_count = 0
      suite = @document.add_element('testsuite')
      suite.attributes['name'] = $1
    end

    def format_test_run_finished(name, time)
      current_suite.attributes['tests'] = @test_count
      current_suite.attributes['failures'] = @fail_count
      @test_count = 0
      @fail_count = 0
    end

    def format_passing_test(suite, test_case, time)
      test_node = current_suite.add_element('testcase')
      test_node.attributes['classname'] = suite
      test_node.attributes['name']      = test_case
      test_node.attributes['time']      = time
      @test_count += 1
    end

    def format_failing_test(suite, test_case, reason, file)
      test_node = current_suite.add_element('testcase')
      test_node.attributes['classname'] = suite
      test_node.attributes['name']      = test_case
      fail_node = test_node.add_element('failure')
      fail_node.attributes['message'] = reason
      fail_node.text = file.sub(@directory.strip + '/', '')
      @test_count += 1
      @fail_count += 1
    end

    def finish
      FileUtils.mkdir_p(File.dirname(FILEPATH))
      formatter = REXML::Formatters::Pretty.new(2)
      formatter.compact = true
      formatter.write(@document, File.open(FILEPATH, 'w+'))
    end


    private

    def current_suite
      @document.elements.to_a.last
    end

  end
end
