# The Array#zip method takes two arrays, and combines them into a single array
# in which each element is a two-element array where the first element is a value 
# from one array, and the second element is a value from the second array, in order. 
# For example:

[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Write your own version of zip that does the same type of operation. 
# It should take two Arrays as arguments, and return a new Array (the original 
# Arrays should not be changed). Do not use the built-in Array#zip method. 
# You may assume that both input arrays have the same number of elements.

def zip(array1, array2)
  zipped_array = []
  array1.each do |item|
    zipped_array << [item, array2.shift]
  end
  zipped_array
end

# or

def zip(array1, array2)
  result = []
  index = 0
  length = array1.length
  while index < length
    result << [array1[index], array2[index]]
    index += 1
  end
  result
end


# Example:

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]