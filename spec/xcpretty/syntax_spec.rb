require 'xcpretty/syntax'

module XCPretty

  describe Syntax do

    before(:each) do
      Syntax.instance_variable_set(:@available, nil)
    end

    it "caches the pygments availability" do
      Syntax.should_receive(:system).once.and_return(false)
      4.times { Syntax.highlight('meh') }
    end

    context "pygments are installed" do

      it "highlights code" do
        Syntax.stub(:system).and_return(true)
        Syntax.highlight('int a = 5;').should include("\e[36mint\e[39;49;00m")
      end

    end

    context "pygments are not installed" do

      it "prints plain code" do
        Syntax.stub(:system).and_return(false)
        Syntax.highlight('int a = 5;').should == 'int a = 5;'
      end

    end
  end
end

