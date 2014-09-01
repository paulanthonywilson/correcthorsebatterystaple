module BookParser::WordParser

  def parse_line line
    line.split.each{|word| yield word if word =~ /^[a-z]+$/}
  end
end
