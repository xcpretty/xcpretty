
module XCPretty
  class JUnit
    include Printer::Matchers

    FILEPATH = "build/reports/junit.xml"

    def load_dependencies
      unless @@loaded ||= false
        require "fileutils"
        require "rexml/document"
        require "rexml/formatters/pretty"
        @@loaded = true
      end
    end

    def initialize
      load_dependencies
      @document = REXML::Document.new
    end

    def handle(line)
      case line
      when TESTS_RUN_START_MATCHER
        @test_count = 0
        suite = @document.add_element("test_suite")
        suite.attributes["name"] = $1
      when TESTS_RUN_COMPLETION_MATCHER
        current_suite.attributes["tests"] = @test_count
        @test_count = 0
      when PASSING_TEST_MATCHER
        create_passing_test_case($1, $2, $3)
        @test_count+=1
      when FAILING_TEST_MATCHER
        create_failing_test_case($2, $3, $4)
        @test_count+=1
      end
    end

    def finish
      FileUtils.mkdir_p(File.dirname(FILEPATH))
      formatter = REXML::Formatters::Pretty.new(2)
      formatter.compact = true
      formatter.write(@document, File.open(FILEPATH,'w+'))
    end

    def current_suite
      @document.elements.to_a.last
    end

    def create_failing_test_case(classname, name, reason)
      test_node = current_suite.add_element("testcase")
      test_node.attributes["classname"] = classname
      test_node.attributes["name"]      = name
      fail_node = test_node.add_element("failure")
      fail_node.attributes["message"] = "test failure"
      fail_node.text = reason
    end

    def create_passing_test_case(classname, name, time)
      test_node = current_suite.add_element("testcase")
      test_node.attributes["classname"] = classname
      test_node.attributes["name"]      = name
      test_node.attributes["time"]      = time
    end
  end
end
