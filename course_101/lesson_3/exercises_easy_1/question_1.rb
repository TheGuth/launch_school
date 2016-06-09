# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq # returns a new array object with unique elements, but does
             # not modify the numbers object. the new array would look like
             # this [1, 2, 3]

puts numbers # 1, 2, 2, 3 since puts automatically calls to_s
