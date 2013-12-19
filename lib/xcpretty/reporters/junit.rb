module XCPretty
  class JUnit

    include XCPretty::FormatMethods
    REPORT_DIR = 'build/test-reports'

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
      @documents = {}
      @parser = Parser.new(self)
    end

    def handle(line)
      @parser.parse(line)
    end

    def format_passing_test(classname, test_case, time)
      puts "formatting passing test"
      test_node = document(classname).root.add_element('testcase')
      test_node.attributes['classname'] = classname
      test_node.attributes['name']      = test_case
      test_node.attributes['time']      = time
      @test_count += 1
    end

    def format_failing_test(classname, test_case, reason, file)
      test_node = document(classname).root.add_element('testcase')
      test_node.attributes['classname'] = classname
      test_node.attributes['name']      = test_case
      fail_node = test_node.add_element('failure')
      fail_node.attributes['message'] = reason
      fail_node.text = file.sub(@directory + '/', '')
      @test_count += 1
      @fail_count += 1
    end

    def finish
      set_test_counters
      FileUtils.mkdir_p(REPORT_DIR)
      formatter = REXML::Formatters::Pretty.new(2)
      formatter.compact = true
      @documents.each do |name, document|
        path = File.join(REPORT_DIR, "TEST-#{name}.xml")
        formatter.write(document, File.open(path, 'w+'))
      end
    end

    private

    def document(classname)
      @last_document = @documents[classname] ||= begin
        puts "Create document for #{classname}"
        set_test_counters
        doc = REXML::Document.new
        doc << REXML::XMLDecl.new('1.0','UTF-8')
        suite = doc.add_element('testsuite')
        suite.attributes['name'] = classname
        doc
      end
    end

    def set_test_counters
      if @last_document && @last_document.root
        @last_document.root.attributes['tests'] = @test_count
        @last_document.root.attributes['failures'] = @fail_count
      end
      @test_count = 0
      @fail_count = 0
    end
  end
end
