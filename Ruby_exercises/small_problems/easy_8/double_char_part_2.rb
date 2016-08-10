# Write a method that takes a string, and returns a new string in which every consonant
# character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace
# should not be doubled.
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def repeater(string)
  new_string = []
  string.split('').each do |item|
    new_string << item * 2
  end
  new_string.join('')
end

def double_consonants(string)
  new_string = []
  string.split('').each do |character|
    new_string << character 
    new_string << character if CONSONANTS.include?(character.downcase)
  end
  new_string.join('')
end

# Examples:

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""