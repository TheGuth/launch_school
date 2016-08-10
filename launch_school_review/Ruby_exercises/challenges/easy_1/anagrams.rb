# Write a program that, given a word and a list of possible anagrams, 
# selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" 
# "google" "inlets" "banana" the program should return a list containing "inlets".
# Please read the test suite for exact rules of anagrams.

require 'pry'

class Anagram
  def initialize(string)
    @string = string
    substrings(@string)
  end

  def substrings_at_start(string)
    result = []
    0.upto(string.size - 1) do |index|
      result << string[0..index]
    end
    result
  end

  def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    binding.pry
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  p results
end

  def match(array)
    matches = []
    possible_matches = substrings(@string)
    array.each do |word|
      matches << word if substrings(@string).include?(word)
    end
    matches.sort
  end
end

# my_anagram = Anagram.new('diaper')
# my_anagram.match(%w(hello world zombies pants))

my_anagram = Anagram.new('ant')
p my_anagram.match(%w(tan stand at))

# my_anagram = Anagram.new('diaper')
# my_anagram.match(%w(hello world zombies pants))