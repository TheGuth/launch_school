# The Enumberable#each_cons method iterates over the members of a collection 
# taking each sequence of n consecutive elements at a time and passing them to 
# the associated block for processing. It then returns a value of nil.

# Write a method called each_cons that behaves similarly for Arrays, taking the 
# elements 2 at a time. The method should take an Array as an argument, and a block. 
# It should yield each consecutive pair of elements to the block, and return nil.

# Your method may use #each, #each_with_object, #inject, loop, for, while, or until
# to iterate through the Array passed in as an argument, but must not use any other
# methods that iterate through an Array or any other collection.

def each_cons(array)
  index1 = 0
  index2 = 1
  while index1 < array.size
    yield(index1, index2)
    index1 += 2
    index2 += 2
  end
  return nil
end

# or

def each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
end


# Examples:

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}