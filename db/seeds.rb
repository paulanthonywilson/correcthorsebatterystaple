File.open(File.dirname(__FILE__) + '/gsl.html').each do |line|
  if line =~/^\d+\s+\d+\s+(\w+)<BR>/
    Word.create(:spelling=>$1)
  end
end
