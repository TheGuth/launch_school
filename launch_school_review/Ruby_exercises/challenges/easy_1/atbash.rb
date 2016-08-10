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
  alphabet =         %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  reverse_alphabet = %w(z y x w v u t s r q p o n m l k j i h g f e d c b a)
  CIPHER = Hash[alphabet.zip reverse_alphabet]
  # CIPHER = Hash[('a'..'z').zip reverse_alphabet]
  # def create_cipher
  #   alphabet =         %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  #   reverse_alphabet = %w(z y x w v u t s r q p o n m l k j i h g f e d c b a)
  # end

  def self.encode(string)
    encoded_message = []
    character_count = 0
    p string.gsub!(/[^\w]/, "")
    string.split('').each_with_index do |character, index|
      if character =~ /\d/
        encoded_message << character
        if character_count >= 4
          encoded_message << ' '
          character_count = 0
        else
          character_count += 1
        end
      else
        encoded_message << CIPHER[character.downcase]
        if character_count >= 4
          encoded_message << ' '
          character_count = 0
        else
          character_count += 1
        end
      end
    end
    p encoded_message.join('').strip
  end

  def print_cipher
    puts CIPHER
  end

end

Atbash.new.print_cipher

p Atbash.encode('no') == 'ml'

p Atbash.encode('yes') == 'bvh'

p Atbash.encode('OMG') == 'lnt'

p Atbash.encode('O M G') == 'lnt'

p Atbash.encode('Testing, 1 2 3, testing.') == 'gvhgr mt123 gvhgr mt'

p Atbash.encode('mindblowingly') == 'nrmwy oldrm tob'


# return value is made up of 5 characters space 5 characters space etc...