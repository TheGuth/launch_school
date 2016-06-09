# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

num = 42

if (10..100).include?(num)
  puts true
else
  puts false
end

# or

(10..100).cover?(42)