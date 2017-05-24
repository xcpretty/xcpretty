require 'xcpretty'
require 'tempfile'
require 'fixtures/constants'

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

    describe '#write_report' do
      def result_xml
        result = ''
        File.open(@reporter_file, 'r') do |f|
          result = f.read
        end
        result
      end

      before do
        @formatter = JUnit.new(option)
        doc = REXML::Document.new(SAMPLE_JUNIT_XML)
        @formatter.instance_variable_set(:@document, doc)
      end

      context "when --pretty-report is not set" do
        let(:option) { {path: @reporter_file.path} }
        it "return pretty xml" do
          @formatter.write_report
          expect(result_xml).to eq(SAMPLE_JUNIT_PRETTY_XML)
        end
      end

      context "when --pretty-report is set" do
        let(:option) { {path: @reporter_file.path, pretty_report: true} }
        it "return pretty xml" do
          @formatter.write_report
          expect(result_xml).to eq(SAMPLE_JUNIT_PRETTY_XML)
        end
      end

      context "when --no-pretty-report is set" do
        let(:option) { {path: @reporter_file.path, pretty_report: false} }
        it "return no pretty xml" do
          @formatter.write_report
          expect(result_xml).to eq(SAMPLE_JUNIT_XML)
        end
      end
    end
  end
end

