# What do you expect to happen when the greeting variable is referenced 
# in the last line of the code below?

if false
  greeting = “hello world”
end

p greeting

# returns nil
# so the variable was initialized in the if statement, but when we call it 
# it returns nil
