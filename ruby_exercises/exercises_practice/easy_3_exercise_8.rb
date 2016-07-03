# Write a method that returns true if the string passed as an argument is a 
# palindrome, false otherwise. ( a palindrome reads the same forwards and backwards)
# case matters, and all cahracters should be considered.

# def palindrome?(string)
#   string == string.reverse
# end

# p palindrome?('madam')
# p palindrome?('Madam')
# p palindrome?("madam i'm adam")
# p palindrome?('356653')

def palindrome?(array)
  string = array.join("").to_s
  string == string.reverse
end

p palindrome?([1, 2, 3, 4, 5])
p palindrome?(['madam'])
p palindrome?(['1', '2', '2', '1'])

