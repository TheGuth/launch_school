# Write a method that takes one argument, a string, and returns the same 
# string with the words in reverse order.
require 'pry'

def reverse_sentence(string)
  return string if string.empty?
  sentence = []
  string.split(' ').each do |word|
    sentence.unshift(word)
  end
  sentence.join(' ')
end

# or

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

# Examples:

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# The tests above should print true.