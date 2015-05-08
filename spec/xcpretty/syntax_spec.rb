require 'xcpretty/syntax'

module XCPretty
  describe Syntax do
    it 'syntax highlights given code' do
      code = 'self.color = [UIColor redColor];'
      snippet = Snippet.new(code, 'test.m')
      output = Syntax.highlight(snippet)

      stripped_output = output.gsub(/(?:(?:\u001b\[)|\u009b)(?:(?:[0-9]{1,3})?(?:(?:;[0-9]{0,3})*)?[A-M|f-m])|\u001b[A-M]/, '')
      stripped_output.should == code
      stripped_output.should_not == output
    end
  end
end

