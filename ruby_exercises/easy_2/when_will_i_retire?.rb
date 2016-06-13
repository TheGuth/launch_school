# Build an program that displays when the user will retire and how many years 
# she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056. 
# You have only 40 years of work to go!

puts "What is your age? "
age = gets.to_i

puts "At what age would you like to retire? "
retire_age = gets.to_i

years_till_retirement = (retire_age - age)

current_year = Time.now.year
retire_year = (current_year + years_till_retirement)

puts "It's #{current_year}. You will retire in #{retire_year}."
puts "You have only #{years_till_retirement} years of work to go!"