# ex6.rb 

types_of_people = 10
# types_of_people is pointed towards the integer 10

x = "There are #{types_of_people} types of people."
# x points towards a string which includes the number 10 from types_of_people
binary = "binary"
# binary points towards the string binary
do_not = "don't"
# do_not points towards "don't"
y = "Those who know #{binary} and those who #{do_not}."
# y points towards a string that includes the variables binary and do_not

puts x
puts y

puts "I said: #{x}."
# prints the above line with what x is pointing towards
puts "I also said: '#{y}."
# prints the above line with what y is pointing towards

hilarious = false
# hilarious points to false
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"
# joke_evaluation points to the string that contains the variable hilarious which equals false

puts joke_evaluation

w = "This is the left side of..."
e = "a string with a right side."

puts w + e
# concatenates the two string variables contained in w and e