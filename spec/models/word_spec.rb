require 'spec_helper'

describe Word do
  describe "random word" do
    before(:each) do
      Word.stub(:count).and_return(2000)
    end

    it "returns the random text of a word" do

      Word.should_receive(:rand).with(2000).and_return(50)
      Word.should_receive(:find).with(:first, :offset=>50).and_return(Word.new(:spelling=>"alligator"));
      assert_equal "alligator", Word.random_word
    end
  end

  describe "random password" do
    it "make a password from 3 random words when called with 3" do
      Word.should_receive(:random_word).exactly(3).times.and_return("fish")
      assert_equal "fish-fish-fish", Word.random_password(3)
    end

    it "make a password from 2 random words when called with 2" do
      Word.should_receive(:random_word).exactly(2).times.and_return("fowl")
      assert_equal "fowl-fowl", Word.random_password(2)
    end
  end
end
