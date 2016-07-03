# Write a method that returns an Array that contains every other element of
# an Array that is passed in as an argument. The values in the returned
# list should be those values that are in the 1st, 3rd, 5th, and so on 
# elements of the argument Array.

require 'pry'

def oddities(array)
  new_array = []
  array.each_index do |idx|
    if idx % 2 == 0
      new_array << array[idx]
    else
      false
    end
  end
end



p oddities([2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])

def oddities(array)
  (0...array.size).step(2).map { |index| array[index] }
end