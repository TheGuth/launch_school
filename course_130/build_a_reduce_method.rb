require 'pry'
# Build a reduce Method

[1, 2, 3].reduce do |acc, num|
  acc + num
end

# => 6

[1, 2, 3].reduce(10) do |acc, num|
  acc + num
end

# => 16

array = [1, 2, 3, 4, 5]

def reduce(array, start_point=0)
  total = 0
  array.each do |item|
    total += yield(0, item)
  end
  total + start_point
end

# or

def reduce(array, default=0)
  counter = 0
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc - num }                    # => -15
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
