a = "Xyzzy"

def my_value(b) # creates a method my_value and takes in one argument
  b[2] = '-' # index of 2 or 0, 1, 2 so the third spot in the string, passed in the
end          # argument, which would return this "Xy-zy" Modifys the string.

my_value(a)
puts a # a = "Xy-zy"