class Word < ActiveRecord::Base

  def self.random_word
    return find(:first, :offset=>rand(count)).spelling
  end

  def self.random_password(word_count)
    words=[]
    word_count.times { words << random_word}
    words * "-"
  end
end
