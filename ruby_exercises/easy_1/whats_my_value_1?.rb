a = 7

def my_value(b) # defines a method my_value which takes one argument represented by b
  b += 10       # argument passed through my_value + 10 = b so the method returns 17
end

my_value(a) # returns 17, but doesn't change a
puts a # a is still 7