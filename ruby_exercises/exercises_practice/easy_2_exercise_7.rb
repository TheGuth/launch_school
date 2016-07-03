(1..99).each do |num|
  if num % 2 == 0
    puts num
  end
end

(1..99).each do |num|
  if num.even?
    puts num
  end
end

number = 1
while number <= 99
  if number % 2 == 0
    puts number
  end
  number += 1
end