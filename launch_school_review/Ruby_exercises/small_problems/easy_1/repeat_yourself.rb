# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# Example:

def repeat(string, number)
  number.times { |item| puts string }
end

repeat('Hello', 3)

# Output:

# Hello
# Hello
# Hello
