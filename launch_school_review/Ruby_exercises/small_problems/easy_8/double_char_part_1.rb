# Write a method that takes a string, and returns a new string in which every character
# is doubled.

def repeater(string)
  new_string = []
  string.split('').each do |item|
    new_string << item * 2
  end
  new_string.join('')
  
end

# or

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

# Examples:

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

