# The code below is an example of a nested loop. Both loops currently loop infinitely. 
# Modify the code so each loop stops after the first iteration.

loop do
  puts 'This is the outer loop.'
  x = 1
  break if x == 1

  loop do
    puts 'This is the inner loop.'
    x += 1
    break if x == 2
  end
end

puts 'This is outside all loops.'