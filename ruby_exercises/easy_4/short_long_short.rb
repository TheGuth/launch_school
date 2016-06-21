
# Write a method that takes two strings as arguments, determines the longest 
# of the two strings, and then returns the result of concatenating the 
# shorter string, the longer string, and the shorter string once again. 
# You may assume that the strings are of different lengths.

# Examples:

# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"


def short_long_short(string1, string2)
  if string1.length >= string2.length
     concatenated_string = string2.to_s + string1.to_s + string2.to_s
  else
    concatenated_string = string1.to_s + string2.to_s + string1.to_s
  end
end

p short_long_short('abc', 'defgh')
p short_long_short('abcde', 'fgh')
p short_long_short('', 'xyz')

def short_long_short(string1, string2)
  arr = [string1, string2].sort_by { |el| el.length }
  arr.first + arr.last + arr.first
end