# Write another method that returns true if the string passed as an argument
# is a palindrome, false otherwise. This time, however, your method should 
# be case-insensitive, and is should ignore all non-alphanumerica characters.
# if you wish, you may simplify things by calling the palindrome? 
# Method you wrote in the previous exercise.

def real_palindrome?(string)
  string.to_s.split('').delete_if { |element| element == ('a'..'z') }
  string.to_s.downcase == string.to_s.reverse.downcase
end

p real_palindrome?('madam')
p real_palindrome?('Madam')
p real_palindrome?("Madam, I'm Adam")
p real_palindrome?('356653')
p real_palindrome?('356a653')
p real_palindrome?('123ab321')
puts ""
p real_palindrome?(34543)
p real_palindrome?(123210)
p real_palindrome?(22)
p real_palindrome?(5)

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end