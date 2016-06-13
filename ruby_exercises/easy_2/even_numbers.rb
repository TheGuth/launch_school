# Print the even numbers from 1 to 99, inclusive. 
# All numbers should be printed on separate lines.

count = 1
while count <= 99
  if count % 2 == 0
    puts count
  end
  count += 1
end

value = 1
while value <= 99
  puts value if value.even?
  value += 1
end

number = 1

loop do
  if number.even?
    puts number
  end
  if number >= 99
    break
  end
  number += 1
end