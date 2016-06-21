# Using the multiply method from the "Multiplying Two Numbers" problem, 
# write a method that computes the square of its argument 
# (the square is the result of multiplying a number by itself).

# Example:

# square(5) == 25
# square(-8) == 64

def square(number)
  squared = number * number
end

puts square(5)
puts square(-8)

def multiply(num, num2)
  answer = num * num2
end

def square1(n)
  multiply(n, n)
end

puts square1(5)
puts square1(-8)