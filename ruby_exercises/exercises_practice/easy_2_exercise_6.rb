(1..99).each do |num|
  if num % 2 != 0
    puts num
  end
end

value = 1
while value <= 99
  puts value
  value += 2
end

(1..99).each do |num|
  if num.odd?
    puts num
  end
end