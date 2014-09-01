require "spec_helper"


describe BookParser::WordParser do
  include BookParser::WordParser

  it "notifies all the words in the line" do

    notified = []
    parse_line("the quick brown fox"){|word| notified << word }
    expect(notified).to eq(%w(the quick brown fox))

  end

  it "igonores any uppercase words" do 
    notified = []
    parse_line("the Quick brOwn fox"){|word| notified << word }
    expect(notified).to eq(%w(the fox))
  end

  it "ignores embedded punctuation or numbers" do

    notified = []
    parse_line("the qui*ck br0wn fox jumps over the-"){|word| notified << word }
    expect(notified).to eq(%w(the fox jumps over))
  end

end
