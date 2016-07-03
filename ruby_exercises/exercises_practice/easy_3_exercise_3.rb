# Write a program that will ask a user for an input of a word or multiple
# words and give back the number of characters. Spaces should not be counted
# as a character.

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Please write a word or multiple words:")
words = gets.chomp.to_s

def word_count(string)
  spaces = string.count(" ")
  final_length = string.length - spaces
  prompt("There are #{final_length} characters in #{string}")
end

word_count(words)
word_count("walk, don't run")

print 'Please write word or multiple words: '
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."
