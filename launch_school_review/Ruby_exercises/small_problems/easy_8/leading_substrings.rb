# Write a method that returns a list of all substrings of a string that start at the 
# beginning of the original string. The return value should be arranged in order 
# from shortest to longest substring.

def substrings_at_start(string)
  string_array = string.split('')
  substrings = []
  1.upto(string_array.size) do |count|
    substrings << string_array.slice(0..count - 1)
  end
  p substrings.map { |item| item.join('') }
end

# or

def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

# Examples:

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
