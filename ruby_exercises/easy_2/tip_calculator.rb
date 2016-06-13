# Create a simple tip calculator. The program should prompt for a bill amount 
# and a tip rate. The program must compute the tip and then display both the 
# tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

puts "What is the bill?"
bill = gets.chomp.to_f

puts "what is the tip percentage?"
tip_percentage = gets.chomp.to_f

tip_to_percent = (tip_percentage / 100.0).round(2)
final_tip = (bill * tip_to_percent).round(2)

final_bill = (bill + final_tip)

puts "the tip is $#{'%.2f' % (final_tip)}"
puts "the total is $#{'%.2f' % (final_bill)}"