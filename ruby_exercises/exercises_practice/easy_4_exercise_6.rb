# Running Totals

require 'pry'

def running_total(array)
  current_total = 0
  new_array = []
  array.each do |item|
    new_array << current_total += item
  end
  new_array
end

# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

# def running_total(array)
#   sum = 0
#   array.each_with_object([]) { |i, a| a << sum += i }
# end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])