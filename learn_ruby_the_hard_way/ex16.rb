# ex16.rb 

filename = ARGV.first
# filename points to the argument passed in this case the file test.txt
puts "We're going to erase #{filename}"
puts "If you don'w want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

$stdin.gets

puts "opening the file..."
target = open(filename, 'w')
# target points to opening of whatever filename is pointed to and allows us to 'w' or write
puts "Truncating the file. Goodbye!"
target.truncate(0)
# target or our file passed is truncated or emptied
puts "Now I'm going to ask you for three lines."

print "line 1:"
line1 = $stdin.gets.chomp
print "line 2:"
line2 = $stdin.gets.chomp
print "line 3:"
line3 = $stdin.gets.chomp
# line 1, 2, 3 all point to user input
puts "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")
# we write to whatever target is pointed at, and creat new lines after each write.
puts "And finally, we close it."
target.close