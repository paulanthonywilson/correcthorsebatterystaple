
self.extend(BookParser::WordParser)

def load_words filename
  if File.directory?(filename) 
    Dir.glob("#{filename}/*").each{|f| load_words(f)}
  else
    File.open(filename) do |f|
      f.each do |line|
        parse_line(line){|word| Word.insert_spelling_if_new(word)} 
      end
    end
  end
end


desc "Load the unique words from a text file or directory"
task :load_words, [:filename] => :environment do |_, args|
  load_words args[:filename]
end


