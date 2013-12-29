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

    it "formats linker failures by default" do
      @formatter.format_linker_failure("Undefined symbols for architecture x86_64",
                                       '_OBJC_CLASS_$_CABasicAnimation',
                                       'objc-class-ref in ATZRadialProgressControl.o').should == %Q(
#{@formatter.red("Undefined symbols for architecture x86_64")}
> Symbol: _OBJC_CLASS_$_CABasicAnimation
> Referenced from: objc-class-ref in ATZRadialProgressControl.o

)
    end

    if RUBY_VERSION > '1.8.7'
      it "formats failures per suite" do
        failures = {
          'CarSpec' => [
            {
              :file => 'path/to/file2',
              :reason => "just doesn't work",
              :test_case => 'Starting the car'
            }],
            'StringSpec' => [
              {
                :file => 'path/to/file1',
                :reason => "doesn't split",
                :test_case => 'Splitting the string'
              }]
        }
        @formatter.format_test_summary(SAMPLE_EXECUTED_TESTS, failures).should == %Q(

CarSpec
  Starting the car, #{@formatter.red("just doesn't work")}
  #{@formatter.cyan("path/to/file2")}

StringSpec
  Splitting the string, #{@formatter.red("doesn't split")}
  #{@formatter.cyan("path/to/file1")}


#{@formatter.red(SAMPLE_EXECUTED_TESTS)})

      end
    end # only ruby 1.9 above because of ordered hashes

  end
end
