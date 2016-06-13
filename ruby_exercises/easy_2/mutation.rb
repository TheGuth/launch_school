# What will the following code print, and why? Don't run the code until 
# you have tried to answer.

array1 = %w(Moe Larry Curly Chemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C') }
puts array2

# array2 also upcases the items in the array with capital C