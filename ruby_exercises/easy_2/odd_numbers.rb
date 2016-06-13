# Print all odd numbers from 1 to 99, inclusive. All numbers should be 
# printed on separate lines.

num = 1

loop do 
  if num % 2 != 0
    puts "#{num}"
  end
  if num >= 99
    break
  end
  num += 1
end

value = 1
while value <= 99
  puts value
  value += 2
end
