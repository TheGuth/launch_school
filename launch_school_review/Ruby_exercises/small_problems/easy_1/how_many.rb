# Write a method that counts the number of occurrences of each element in a
# given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  occurrences = {}
  array.each do |item|
    if occurrences.include?(item)
      occurrences[item] += 1
    else
      occurrences[item] = 1
    end
  end
  occurrences
end

# or

def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end


p count_occurrences(vehicles)

# Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
