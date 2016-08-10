# You're now ready for the coding challenge. If you've been working through the 
# weekly challenges, the code challenge will probably take between 1-2 hours. 
# If you haven't done too many of these types of challenges before, be prepared
# to spend more time than that.

# Instructions

# Below is the coding challenge. You can of course google for Ruby 
# and general programming concepts, but please do not google solution
# to this problem.

# make sure to run your code through Rubocop. 
# It doesn't have to pass 100%, but use your judgement.
# make sure all tests pass.
# push this to a secret gist, or a private repo. 
# Don't push your solution to public repo.
# In the interview, be prepared for:

# questions and live coding on topics from courses 101, 120 and 130

# questions and refactoring of your code from the code challenge here

# Atbash Cipher Coding Challenge

# Create an implementation of the atbash cipher, 
# an ancient encryption system created in the Middle East.

# It's a substitution cipher that substitutes the first letter for the last, 
# the second letter for second to last, etc. Example:

#  First 13 letters: A|B|C|D|E|F|G|H|I|J|K|L|M
#  Last 13 letters:  Z|Y|X|W|V|U|T|S|R|Q|P|O|N

# In Atbash, the letters "nlmvb" indicate the word "money".

# From https://en.wikipedia.org/wiki/Atbash

require 'pry'

class Atbash

  def self.reverse_alphabet
    r_alphabet = []
    ('a'..'z').each do |char|
      r_alphabet.unshift(char)
    end
    r_alphabet
  end

  CIPHER = Hash[('a'..'z').zip self.reverse_alphabet]

  def self.encode(string)
    @encoded_message = []
    @character_count = 0
    compact_message(string)

    string.split('').each_with_index do |character, index|
      if self.is_number?(character)
        @encoded_message << character
        self.encoded_spacing
      else
        @encoded_message << CIPHER[character.downcase]
        self.encoded_spacing
      end
    end
    p @encoded_message.join('')
  end

  private

  def self.compact_message(message)
    message.gsub!(/[^\w]/, "") # replaces any character that isn't a-z, A-Z, 0-9 
  end                          # with ""

  def self.encoded_spacing
    if @character_count >= 4  # if encoded message counts to 4 from 0 it adds a space
      @encoded_message << ' ' # to the encoded message, and resets count to 0
      @character_count = 0
    else
      @character_count += 1 # otherwise it adds 1 to count
    end
  end

  def self.is_number?(string)
    string =~ /\d/          # checks if there is a digit in string.
  end
end
p Atbash.encode('')

p Atbash.encode('no') == 'ml'

p Atbash.encode('yes') == 'bvh'

p Atbash.encode('OMG') == 'lnt'

p Atbash.encode('O M G') == 'lnt'

p Atbash.encode('Testing, 1 2 3, testing.') == 'gvhgr mt123 gvhgr mt'

p Atbash.encode('mindblowingly') == 'nrmwy oldrm tob'

# return value is made up of 5 characters space 5 characters space etc...