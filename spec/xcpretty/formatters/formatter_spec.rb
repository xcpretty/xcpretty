require 'xcpretty'

module XCPretty

  describe Formatter do

    before(:each) do
      @formatter = Formatter.new(true, true)
    end

    it "initializes with unicode" do        
      @formatter.use_unicode?.should be_true
    end

    it "initializes with color" do 
      @formatter.colorize?.should be_true
    end

    it "outputs to new lines by default" do
      @formatter.optional_newline.should == "\n"
    end

if RUBY_VERSION > '1.8.7'
    it "formats failures per suite" do
      failures = {
        'StringSpec' => [
          {
            :file => 'path/to/file1',
            :reason => "doesn't split",
            :test_case => 'Splitting the string'
          }
        ],
        'CarSpec' => [
          {
            :file => 'path/to/file2',
            :reason => "just doesn't work",
            :test_case => 'Starting the car'
          }
        ]
      }
      @formatter.format_test_summary(SAMPLE_EXECUTED_TESTS, failures).should == %Q(

StringSpec
  Splitting the string, #{@formatter.red("doesn't split")}
  #{@formatter.cyan("path/to/file1")}

CarSpec
  Starting the car, #{@formatter.red("just doesn't work")}
  #{@formatter.cyan("path/to/file2")}


#{@formatter.red(SAMPLE_EXECUTED_TESTS)})
    end

end
  end
end
