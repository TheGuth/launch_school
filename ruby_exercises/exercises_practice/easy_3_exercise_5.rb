# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument (the square is the
# result of multiplying a number by itself)

def multiply(num_1, num_2)
  num_1 * num_2
end

def square(number)
  multiply(number, number)
end

p square(5)
p square(-8)

def power(num, power)
  (multiply(num, num)) * 8
end

p power(2, 8)
puts 2 ** 8