# Write a method that takes one argument, a positive integer, and returns
# the sum of its digits.

def sum(number)
  total = 0
  number.to_s.split('').each do |number|
    total += number.to_i
  end
  total
end

# or

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

# Examples:

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs 
# (while, until, loop, and each).

