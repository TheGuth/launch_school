# Catch the Number

# Modify the following code so that the loop stops if number is between 0 and 10.

loop do
  number = rand(100)
  puts number
  break if number <= 10 && number >= 0

end

# or

loop do
  number = rand(100)
  puts number

  if number.between?(0, 10)
    break
  end
end
