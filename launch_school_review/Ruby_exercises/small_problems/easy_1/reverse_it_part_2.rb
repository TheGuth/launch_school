# Write a method that takes one argument, a string containing one or
# more words, and returns the given string with all five or more
# letter words reversed. Each string will consist of only letters and 
# spaces. Spaces should be included only when more than one word is present.
require 'pry'

def reverse_words(string)
  reversed_string = []
  if string.split(' ').size > 1
    string.split(' ').each do |word|
      reversed_string.push(word.reverse)
    end
  else
    return string.reverse
  end
  reversed_string.join(' ')
end

# or

def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end


# Examples:

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
