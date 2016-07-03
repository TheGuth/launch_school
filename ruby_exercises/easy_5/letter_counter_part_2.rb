# Letter COunter Part 2

def word_sizes(string)
  my_hash = Hash.new(0)
  new_string = string.gsub(/[^0-9A-Za-z]/, ' ')
  new_string.split(' ').each do |word|
    my_hash[word.size] += 1
  end
  p my_hash
end


word_sizes('Four score and seven.')# == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!')# == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?")# == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('')# == {}