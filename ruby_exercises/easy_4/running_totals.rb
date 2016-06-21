# Write a method that takes an Array of numbers, and returns an Array with the same 
# number of elements, and each element has the running total from the original Array.

# Examples:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# def running_total(array)
#   array.each do |number|
#     previous_number = 0
#     new_total = previous_number + number
#     previous_number = number
#     array.push(new_total)
#     array.pop(number)
#   end
# end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])
