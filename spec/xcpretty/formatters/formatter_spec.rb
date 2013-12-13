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

    it "formats failures per suite" do
      failures = {
        'StringSpec' => [
          {
            :file => 'path/to/file1',
            :reason => 'doesnt split',
            :test_case => 'Splitting the string'
          }
        ],
        'CarSpec' => [
          {
            :file => 'path/to/file2',
            :reason => 'just doesnt work',
            :test_case => 'Starting the car'
          }
        ]
      }
      @formatter.format_failures(failures).should == %Q(
StringSpec
  Splitting the string, doesnt split
  path/to/file1

CarSpec
  Starting the car, just doesnt work
  path/to/file2)
    end

  end
end
