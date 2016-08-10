# Write a program that displays a welcome message, but only after the user enters the
# correct password, where the password is a string that is defined as a constant in your
# program. Keep asking for the password until the user enters the correct password.

# Examples:

# $ ruby password.rb
# >> Please enter your password:
# Hello
# >> Invalid password!
# >> Please enter your password:
# Secret
# >> Invalid password!
# >> Please enter your password:
# SecreT
# Welcome!

PASSWORD = 'SecreT'

puts "Please enter your password:"
answer = gets.chomp
loop do
  if answer == PASSWORD
    puts "Welcome!"
    break
  else
    puts "Invalid password!"
    answer = gets.chomp
  end
end