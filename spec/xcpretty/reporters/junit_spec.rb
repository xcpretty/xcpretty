require 'xcpretty'
require 'fixtures/constants'
require 'tempfile'

module XCPretty
  describe JUnit do
    before(:each) do
      @reporter_file = Tempfile.new('junit')
      @formatter = JUnit.new(path: @reporter_file.path)
    end

    it "has name attribute in root node" do
      test_name = "ReactiveCocoaTests.xctest"
      @formatter.format_test_run_started(test_name)
      @formatter.finish
      document = REXML::Document.new(@reporter_file)
      document.root.attributes['name'].should == test_name
    end

    it "reports Swift Testing results" do
      parser = Parser.new(@formatter)
      [SAMPLE_SWIFT_TESTING_RUN_STARTED,
       SAMPLE_SWIFT_TESTING_ISSUE,
       SAMPLE_SWIFT_TESTING_TEST_FAILED,
       SAMPLE_SWIFT_TESTING_TEST_PASSED,
       SAMPLE_SWIFT_TESTING_CASES_PASSED,
       SAMPLE_SWIFT_TESTING_RUN_FAILED].each { |line| parser.parse(line) }
      @formatter.finish

      document = REXML::Document.new(@reporter_file)
      document.root.attributes['tests'].should == '3'
      document.root.attributes['failures'].should == '1'

      suite = document.get_elements('//testsuite')
                      .find { |s| s.attributes['name'] == 'Swift Testing' }
      suite.attributes['tests'].should == '3'
      suite.attributes['failures'].should == '1'

      failure = document.get_elements('//failure').first
      failure.attributes['message'].should ==
        'Expectation failed: stlib.add(2, 2) == 5'
    end
  end
end

