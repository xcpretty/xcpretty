require 'xcpretty/syntax'

module XCPretty

  describe Syntax do

    let(:snippet) { Snippet.new('self.color = [UIColor redColor];', 'test.m') }
    let(:code) { snippet.contents }

    it "caches the pygments availability" do
      Pygments.should_receive(:system).once.and_return(false)
      4.times { Syntax.highlight(Snippet.new('meh')) }
    end

    context "pygments are installed" do

      before(:each) do
        Pygments.stub(:available?).and_return(true)
      end

      it 'supports highlighting with options' do
        Pygments.should_receive(:pygmentize).with(code, 'objc', '-f html')
        Syntax.highlight(snippet, '-f html')
      end

      it 'highlights objective-c code by filename' do
        Pygments.should_receive(:pygmentize).with(code, 'objc', '')
        Syntax.highlight(snippet)
      end

      it 'highlights objective-c code by default' do
        Pygments.should_receive(:pygmentize).with(code, 'objc', '')
        Syntax.highlight(Snippet.new(code))
      end

      it 'highlights other languages by filename' do
        test_language 'swift',  '.swift'
        test_language 'c++',    '.cc', '.cpp', '.hpp', '.c++', '.cxx'
        test_language 'objc++', '.mm', '.hh'
        test_language 'objc',   '.m', '.h'
        test_language 'dylan',  '.dyl'
        test_language 'ruby',   '.rb', '.ruby'
      end

      def test_language(language, *extensions)
        extensions.each do |extension|
          Pygments.should_receive(:pygmentize).with(code, language, '')
          Syntax.highlight(Snippet.new(code, "file#{extension}"))
        end
      end
    end

    context "pygments are not installed" do

      it "prints plain code" do
        Syntax.stub(:system).and_return(false)
        Syntax.highlight(snippet).should == 'self.color = [UIColor redColor];'
      end

    end
  end
end

