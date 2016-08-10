# Write a program that asks the user for their age in years, and then converts that age 
# to months.

# Examples:

# $ ruby age.rb
# >> What is your age in years?
# 35
# You are 420 months old.

puts "What is your age in years"
age_years = gets.chomp
months = age_years.to_i * 12

puts "Your age in years is #{age_years} which is #{months} months"

# or

puts '>> What is you age in years?'
age_in_years = gets
age_in_months = 12 * age_in_years.to_i
puts "You are #{age_in_months} months old."
