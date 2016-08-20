# Write a program that, given a word and a list of possible anagrams, 
# selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" 
# "google" "inlets" "banana" the program should return a list containing "inlets".
# Please read the test suite for exact rules of anagrams.
class Anagram
  attr_reader :word, :letters

  def initialize(word)
    @word = word.downcase
    @letters = @word.chars.sort
  end

  def sorted_letters(str)
    p str.downcase.chars.sort
    #yeah I could have just put this in my select block, but this looks nicer
  end

  def match(word_array)
    word_array.select { |ana| sorted_letters(ana) == letters && ana.downcase != word }
  end
end

p Anagram.new('ant').match(%w(tan stand at))
