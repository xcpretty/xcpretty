require 'xcpretty/term'

module XCPretty
  describe Term do
    it "marks unicode as unavailable" do
      Encoding.stub(:default_external).and_return(Encoding::ASCII)
      Term.unicode?.should be_false
    end

    it "marks unicode as available" do
      Encoding.stub(:default_external).and_return(Encoding::UTF_8)
      Term.unicode?.should be_true
    end

    it 'marks color as unavailable' do
      STDOUT.stub(:tty?).and_return(false)
      Term.color?.should be_false
    end

    it 'marks color as available' do
      STDOUT.stub(:tty?).and_return(true)
      Term.color?.should be_true
    end
  end
end

