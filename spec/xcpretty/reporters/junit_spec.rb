require 'xcpretty'

module XCPretty
  describe JUnit do
    before(:each) do
      @reporterFile = Tempfile.new('junit')
      @formatter = JUnit.new({path: @reporterFile.path})
    end

    it "has name attribute in root node" do
      test_name = "ReactiveCocoaTests.xctest"
      @formatter.format_test_run_started(test_name)
      @formatter.finish

      document  = REXML::Document.new(@reporterFile)
      document.root.attributes['name'].should == test_name
    end
  end
end


