# The Ruby Array class has several methods for removing items from the array. 
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
# What does the follow method calls do 
# (assume we reset numbers to the original array between method calls)?

puts numbers.delete_at(1) # deletes at index 1 which would be the 2
# [1, 3, 4, 5]
puts numbers.delete(1) # deletes the number 1 which would be at index 2.
# [2, 3, 4, 5]