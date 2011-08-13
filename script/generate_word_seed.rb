#!/usr/bin/env ruby
#
#
#

seeds_file = File.dirname(__FILE__) + "/../db/seeds.rb"


File.open(seeds_file, 'w') do |seeds|
  File.open('/usr/share/dict/words').each do |word|
    word.strip!.downcase!
    if word.size > 4 && word.size < 16
      seeds << "Word.create(:spelling=>'#{word}')\n"
    end
  end
end

