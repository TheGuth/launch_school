# Write a method that returns a list of all substrings of a string. 
# The returned list should be ordered by where in the string the substring begins. 
# This means that all substrings that start at position 0 should come first, 
# then all substrings that start at position 1, and so on. Since multiple substrings
# will occur at each position, the substrings at a given position should be returned 
# in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the 
# previous exercise:

def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  count = 0
  result = []
  original_string_length = string.size
  loop do
    result << substrings_at_start(string)
    string = string.split('').rotate
    string.pop
    string = string.join('')
    count += 1
    break if count > original_string_length
  end
  p result.flatten
end

# or

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end


# Examples:

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]