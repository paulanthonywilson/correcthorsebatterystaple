class Word < ActiveRecord::Base

  def self.random_word
    self.offset(SecureRandom.random_number(count)).limit(1).first.spelling
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

  def self.insert_spelling_if_new spelling
    Word.create!(spelling: spelling)
  rescue ActiveRecord::RecordNotUnique => e
    # ignore
  end



end
