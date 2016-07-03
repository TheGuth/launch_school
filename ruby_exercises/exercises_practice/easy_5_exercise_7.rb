

def word_sizes(string)
  my_hash = {}
  count = 1
  words = string.split(' ')
  words.each do |word|
    word.gsub!(/[^0-9A-Za-z]/, '')
    if my_hash.include?(word.length)
      my_hash[word.length] += 1
    else
      my_hash[word.length] = count
    end
  end
  p my_hash
end

word_sizes('Four score and seven.')# == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!')# == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?")# == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('')# == {}