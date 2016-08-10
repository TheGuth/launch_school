# Write a method that takes a sorted array of integers as an argument, 
# and returns an array that includes all of the missing integers (in order) 
# between the first and last elements of the argument.

def missing(array)
  all_numbers = []
  first_number = array.sort.first 
  last_number = array.sort.last
  (first_number..last_number).each do |number|
    if array.include?(number)
      next
    else
      all_numbers << number
    end
  end
  all_numbers
end

# or

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# Examples:

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []