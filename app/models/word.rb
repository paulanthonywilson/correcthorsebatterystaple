class Word < ActiveRecord::Base

  def self.random_word
    return find(:first, :offset=>SecureRandom.random_number(count)).spelling
  end

  def self.random_password(minimum_word_count, minimum_password_length=1, separator="-")
    result = ""
    count = 0;
    next_separator = ""
    while(count < minimum_word_count || result.size < minimum_password_length) do
      result += next_separator +  random_word
      next_separator = separator
      count+=1
    end
    result
  end
end
