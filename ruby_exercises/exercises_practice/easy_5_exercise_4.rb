# Letter Swap

def swap(string)
  new_array = []
  string = string.split(" ")
  string.each do |word|
    new_word = word.split("")
    first_letter = new_word.shift
    last_letter = new_word.pop
    new_word.unshift(last_letter)
    new_word << first_letter
    new_array << new_word.join()
  end
  new_array
end

p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a')

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')

end