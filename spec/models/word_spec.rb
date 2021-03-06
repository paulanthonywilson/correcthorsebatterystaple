require 'spec_helper'

describe Word do
  describe "random word" do
    before(:each) do
      allow(Word).to receive(:count).and_return(2000)
    end

    it "returns the random text of a word" do

      mock_relation = double("relation")
      expect(SecureRandom).to receive(:random_number).with(2000).and_return(50)

      expect(Word).to receive(:offset).with(50).and_return(mock_relation);
      expect(mock_relation).to receive(:limit).with(1).and_return([Word.new(spelling:"alligator")])
      assert_equal "alligator", Word.random_word
    end
  end

  describe "random password" do
    it "make a password from 3 random words when asked for 3 words if total length is satisfied" do
      expect(Word).to receive(:random_word).exactly(3).times.and_return("fish")
      assert_equal "fish-fish-fish", Word.random_password(3)
    end

    it "make a password from 2 random words when called with 2 if total length is satisfied" do
      expect(Word).to receive(:random_word).exactly(2).times.and_return("fowl")
      assert_equal "fowl-fowl", Word.random_password(2)
    end

    it "allows different separators" do
      expect(Word).to receive(:random_word).exactly(3).times.and_return("an")
      assert_equal "an-an-an", Word.random_password(1, 6)
    end

    it "can change separator" do
      allow(Word).to receive(:random_word).and_return("oh")
      assert_equal "ohaoh", Word.random_password(2,1,"a")
    end

    it "includes the separator in minimum password size" do
      allow(Word).to receive(:random_word).and_return("oh")
      assert_equal "ohaaaoh", Word.random_password(1,7, "aaa")
    end
  end


  describe "insert spelling if new" do
    it "inserts a spelling" do
      Word.insert_spelling_if_new "staple"
      expect(Word.where(spelling: "staple").count).to eq(1)
    end
    it "inserts a spelling only once" do
      Word.insert_spelling_if_new "staple"
      Word.insert_spelling_if_new "staple"
      expect(Word.where(spelling: "staple").count).to eq(1)
    end
  end
end
