# Create a simple tip calculator. The program should prompt for a bill amount and a 
# tip rate. The program must compute the tip and then display both the tip and the 
# total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

puts "What is your bill amount? "
bill = gets.chomp.to_i

puts "What is the tip percentage? "
tip = gets.chomp.to_i

def tip(number)
  tip_percentage = (number / 100.0).round(2)
end

final_tip = (tip(tip) * bill).round(2)
total_bill = (final_tip + bill).round(2)

puts "The tip is $#{final_tip}" + "0"
puts "The total bill now comes to $#{total_bill}" + "0"