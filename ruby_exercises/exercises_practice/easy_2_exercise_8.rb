def prompt(msg)
  puts "=> #{msg}"
end

def sum(number)
  total = 0
  (1..number).each do |num|
    total = total + num
  end
  prompt("The sum of the integers between 1 and #{number} is #{total}")
end

def product(number)
  total = 1
  (1..number).each do |num|
    total = total * num
  end
  prompt("The product of the integers between 1 and #{number} is #{total}")
end

prompt("Please enter an integer greater than 0:")
answer = gets.chomp.to_i
prompt("Enter 's' to compute the sum, 'p' to compute the product.")

loop do
  sum_or_product = gets.chomp
  if sum_or_product.downcase == 's'
    sum(answer)
    break
  elsif sum_or_product.downcase == 'p'
    product(answer)
    break
  else
    prompt("oopse that wasn't one of the choices.")
    prompt("Please Enter 's' to compute the sum, 'p' to compute the product.")
    sum_or_product = gets.chomp
  end
end

num = 5
def sum_of_number(number)
  total = (1..number).reduce(:+)
  total
end

puts sum_of_number(num)