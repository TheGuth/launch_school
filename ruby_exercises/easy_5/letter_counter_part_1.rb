# letter counter part 1

def word_sizes(string)
  my_hash = Hash.new(0)
  initial_value = 1
  string.split(' ').each do |word|
    my_hash[word.size] += 1
  end
  my_hash
  
end

p word_sizes('Four score and seven.')# == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!')# == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?")# == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('')# == {}