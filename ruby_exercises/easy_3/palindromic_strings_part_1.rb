# Write a method that returns true if the string passed as an argument 
# is a palindrome, false otherwise. (A palindrome reads the same forwards 
# and backwards.) Case matters, and all characters should be considered.

# Examples:

# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true


def palindrome?(word)
  if word.to_s == word.to_s.reverse
    return true
  else
    return false
  end
end

# _________________________________________________________

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam')
p palindrome?('Madam')
p palindrome?("madam i'm adam")
p palindrome?('356653')

def array_palindrome?(array)
  array == array.reverse
end

p array_palindrome?([1, 2, 3])
p array_palindrome?([1, 1, 1])

def palindrome_array_or_string(item)
  palindrome?(item) || array_palindrome?(item)
end

p palindrome_array_or_string([1, 1, 1])
p palindrome_array_or_string("madam")
p palindrome_array_or_string([1, 2, 3])
p palindrome_array_or_string("string")


