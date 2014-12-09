require 'xcpretty/syntax'

module XCPretty

  describe Syntax do

    before(:each) do
      Syntax.instance_variable_set(:@available, nil)
    end

    it "caches the pygments availability" do
      Syntax.should_receive(:system).once.and_return(false)
      4.times { Syntax.highlight(Snippet.new('meh')) }
    end

    context "pygments are installed" do

      before(:each) do
        Syntax.stub(:system).and_return(true)
      end

      it 'highlights objective-c code by default' do
        Syntax.highlight(Snippet.new('int a = 5;')).should ==
          "\e[38;5;125mint\e[39m a \e[38;5;241m=\e[39m \e[38;5;241m5\e[39m;\n"
      end

      it 'highlights objective-c code by filename' do
        snippet = Snippet.new(
          'self.detailLabel.textColor = [UIColor redColor];', 'test.m')
        Syntax.highlight(snippet).should ==
          "\e[38;5;28mself\e[39m.detailLabel.textColor \e[38;5;241m=\e[39m " +
          "[\e[38;5;28mUIColor\e[39m redColor];\n"
      end

      it 'highlights swift code by filename' do
        snippet = Snippet.new('var array : Array = [1,2,3,4]', 'test.swift')
        Syntax.highlight(snippet).should ==
          "\e[38;5;28;01mvar\e[39;00m \e[38;5;18marray\e[39m : \e[38;5;28m" +
          "Array\e[39m = [\e[38;5;241m1\e[39m,\e[38;5;241m2\e[39m," +
          "\e[38;5;241m3\e[39m,\e[38;5;241m4\e[39m]\n"
      end

      it 'highlights c++ code by filename' do
        snippet = Snippet.new(
          'observing_widget_->GetFocusManager()->UnregisterAccelerators(this);',
          'test.cc')
        Syntax.highlight(snippet).should ==
          "observing_widget_\e[38;5;241m-\e[39m\e[38;5;241m>\e[39m" +
          "GetFocusManager()\e[38;5;241m-\e[39m\e[38;5;241m>\e[39m" +
          "UnregisterAccelerators(\e[38;5;28;01mthis\e[39;00m);\n"
      end

      it 'highlights objective-c++ code by filename' do
        snippet = Snippet.new(
          'self.detailLabel.textColor = [UIColor redColor];', 'test.mm')
        Syntax.highlight(snippet).should ==
          "\e[38;5;28mself\e[39m.detailLabel.textColor \e[38;5;241m=\e[39m " +
          "[\e[38;5;28mUIColor\e[39m redColor];\n"
      end

      it 'highlights dylan code by filename' do
        snippet = Snippet.new(
          'define method write-end-array (serializer :: <json-serializer>)',
          'test.dyl')
        Syntax.highlight(snippet).should ==
          "\e[38;5;28;01mdefine\e[39;00m \e[38;5;28mmethod\e[39m write-" +
          "end-array (serializer :: \e[38;5;21;01m<json-serializer>\e[39;00m)\n"
      end

      it 'highlights ruby code by filename' do
        snippet = Snippet.new(
          'UIColor.colorWithWhite(0.9, alpha:1.0)', 'test.rb')
        Syntax.highlight(snippet).should ==
          "\e[38;5;88mUIColor\e[39m\e[38;5;241m.\e[39mcolorWithWhite" +
          "(\e[38;5;241m0\e[39m\e[38;5;241m.\e[39m\e[38;5;241m9\e[39m," +
          " \e[38;5;18malpha\e[39m:\e[38;5;241m1\e[39m\e[38;5;241m.\e[39m" +
          "\e[38;5;241m0\e[39m)\n"
      end
    end

    context "pygments are not installed" do

      it "prints plain code" do
        Syntax.stub(:system).and_return(false)
        Syntax.highlight(Snippet.new('int a = 5;')).should == 'int a = 5;'
      end

    end
  end
end

