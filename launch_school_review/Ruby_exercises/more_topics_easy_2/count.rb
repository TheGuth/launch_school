# The Enumerable#count method iterates over the members of a collection, 
# passing each element to the associated block. It then returns the number 
# of elements for which the block returns a truthy value.

# Write a method called count that behaves similarly for Arrays. It should take 
# an Array as an argument, and a block. It should return the total number of elements
# for which the block returns true.

# If the Array is empty, count should return 0.

# Your method may use #each, #each_with_object, #each_with_index, #inject,
# loop, for, while, or until to iterate through the Array passed in as an argument, 
# but must not use any other methods that iterate through an Array or any other 
# collection.

def count(array)
  count = 0
  array.each do |item|
    count += 1 if yield(item)
  end
  count
end

# Examples:

p count([1, 3, 6]) { |value| value.odd? } == 2
p count([1, 3, 6]) { |value| value.even? } == 1
p count([1, 3, 6]) { |value| value > 6 } == 0
p count([1, 3, 6]) { |value| true } == 3
p count([]) { |value| true } == 0
p count([1, 3, 6]) { |value| value - 6 } == 3
