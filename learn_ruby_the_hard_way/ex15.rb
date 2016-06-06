# ex15.rb 

filename = ARGV.first
# filename points to the single argument given to the program
txt = open(filename)
# txt points to open(filename) or opens whatever argument is given (should be a file of some sort)
puts "Here's your file #{filename}:"
# prints the string below including the name of the argument passed as a string
print txt.read
# prints the reading of what txt is pointed at
print "Type the filename again: "
# prints a string asking for the user to type the name again
file_again = $stdin.gets.chomp
# points file_again at a prompt for the user to input a file
txt_again = open(file_again)
# txt_again points to open(file_again) opens the input specified by the user in file_againg
print txt_again.read
# prints the reading of txt_again