# Exercises Medium 1

# Question 1. Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in 
  # the days before computers had video screens).

# For this exercise, write a one-line program that creates the following output
# 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

statement = "The Flintstones Rock!"
10.times { |number| puts (" " * number) + statement }

# Question 2. Create a hash that expresses the frequency with which each letter 
# occurs in this string:

statement = "The Flintstones Rock"
# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

new_statement = statement.split(" ").join('').chars
p new_statement

my_hash = {}
new_statement.each do |character|
  if my_hash.has_key?(character)
    my_hash[character] += 1
  else
    my_hash[character] = 1
  end
end

p my_hash

# or

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

# Question 3. The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# trying to add integers to a string.
# string interploration #{}
# or .to_s on (40 + 2).to_s

# Question 4. What happens when we modify an array while we are iterating over it? 
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1 3

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1 2 

# Question 5. Alan wrote the following method, which was intended to show all of 
# the factors of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

# Alyssa noticed that this will fail if you call this with an input of 0 or a negative 
# number and asked Alan to change the loop. How can you change the loop construct 
# (instead of using begin/end/until) to make this work? Note that we're not looking to 
# find the factors for 0 or negative numbers, but we just want to handle it gracefully 
# instead of raising an exception or going into an infinite loop.

# Bonus 1

# What is the purpose of the number % dividend == 0 ?

# Bonus 2

# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?

def factors(number)
  dividend = numberdivisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 0
  end
  divisors
end

# Allows you to determine if the result of the division is an integer number (no remainder)
#
# THe return value of the method is the last statement executed. If you take the line away
# this method would return nil.

# Question 6. Alyssa asked Ben to write up a basic implementation of a Fibonacci 
# calculator, A user passes in two numbers, and the calculator will keep computing 
# the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got 
# an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# How would you fix this so that it works?

# define limit within the scope of the method. or pass the limit in as an argument

# Question 8. In another example we used some built-in string methods to change the 
# case of a string. A notably missing method is something provided in Rails, 
# but not in Ruby itself...titleize! This method in Ruby on Rails creates a string 
# that has each word capitalized as it would be in a title.

# Write your own version of the rails titleize implementation.

my_string = 'hello world you are awesome'

def titleize!(string)
  new_string = string.split(" ").each do |word|
    word.capitalize!
  end
  new_string.join(" ")
end

p titleize!(my_string)

# or
p my_string.split.map { |word| word.capitalize }.join(' ')

# Question 9. Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional 
#{ }"age_group" key that has one of three values describing the age group the family 
# member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior
# is aged 65+.

# hint: try using a case statement along with Ruby Range objects in your solution

munsters.each do |k, v|
  case
  when munsters[k]['age'] < 18
    munsters[k]['age_group'] = 'kid'
  when munsters[k]['age'] < 65
    munsters[k]['age_group'] = 'adult'
  else
    munsters[k]['age_group'] = 'senior'
  end
end

p munsters

# or

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters
