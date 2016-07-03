# Letter Counter Part 1

def word_sizes(string)
  my_hash = {}
  count = 1
  words = string.split(' ')
  words.each do |word|
    if my_hash.include?(word.length)
      my_hash[word.length] += 1
    else
      my_hash[word.length] = count
    end
  end
  p my_hash
end

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    p counts[word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') # == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!')#  == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") # == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') # == {}