
desc "Load the unique words from a text file"
task :load_words, [:filename] => :environment do |_, args|
  self.extend(BookParser::WordParser)
  File.open(args[:filename]) do |f|
    f.each do |line|
      parse_line(line){|word| Word.insert_spelling_if_new(word)} 
    end
  end
end
