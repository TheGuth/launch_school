# ex12.rb 

print "Give me a number: "
number = gets.chomp.to_i

bigger = number * 100
puts "A bigger number is #{bigger}"

print "Give me another number: "
another = gets.chomp
number = another.to_i

smaller = number / 100
puts "A smaller number is #{smaller}."

# __________________________________________________

print "give me a dollar amount"
dollar = gets.chomp.to_f

ten_percent = dollar * 0.10

puts "here is your tip #{ten_percent}"