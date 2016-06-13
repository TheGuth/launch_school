a = 7

def my_value(b)
  b = a + a  # error because a is undefined within the scope of the method
end

my_value(a) # gives an undefined variable or method error
puts a  # a = 7