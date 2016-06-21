# Write a method that computes the sum of all numbers between 1 and some other 
# number that are a multiple of 3 or 5. For instance, if the supplied number is 20, 
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Examples

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

def multisum(number)
  total = 0
  1.upto(number) do |x|
    if x % 3 == 0 || x % 5 == 0
      total = total + x
    end
  end
  total
end



p multisum(3)
p multisum(5)
p multisum(10)
p multisum(1000)

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = 0
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number 
    end
  end
  sum
end

# ________________________

def multisum(number)
  1.upto(number).inject { |sum, n| sum + n }