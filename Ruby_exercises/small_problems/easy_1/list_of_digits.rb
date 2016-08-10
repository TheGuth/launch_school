# Write a method that takes one argument, a positive integer, and 
# returns a list of the digits in the number.

def digit_list(number)
  results = []
  number.to_s.split('').each do |number|
    results << number.to_i
  end
  results
end

# or

def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

# or

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

# Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]

# All of the tests above should print true.