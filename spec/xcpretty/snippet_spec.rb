require 'xcpretty/snippet'

module XCPretty

  describe Snippet do

    let(:path) { File.expand_path('spec/fixtures/NSStringTests.m:36') }

    it "gets the snippet out of the file path" do
      Snippet.from_filepath(path).should ==
<<-EOS
    it(@"-split: splits with delimiter string, not just a char", ^{
        [[[@"one / two / three" split:@" / "] should] equal:@[@"one", @"two", @"three"]];
    });
EOS
    end

    it "doesn't crash when there's nothing to read" do
      path = File.expand_path('spec/fixtures/NSStringTests.m:64')
      Snippet.from_filepath(path).should == "\nSPEC_END"
    end

  end
end

