# What happens when we modify an array while we are iterating over it? 
# What would be output by this code?

# output would be print number, and then remove first item of the array
# so 1, 3 numers = []

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# What would be output by this code?

# output would print number and then remove the last item of the array
# so 1, 2 numbers = []

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end