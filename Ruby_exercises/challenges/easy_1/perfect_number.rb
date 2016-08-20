# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.

class PerfectNumber

  def self.classify(number)
    raise RuntimeError if number < 0
    if divisors_total(number) == number
      'perfect'
    elsif divisors_total(number) > number
      'abundant'
    else
      'deficient'
    end
  end

  def self.divisors(number)
    divisor_array = []
    (1..number - 1).each do |num|
      if number % num == 0
        divisor_array << num
      end
    end
    divisor_array
  end

  def self.divisors_total(number)
    total = 0
    divisors(number).each do |item|
      total += item
    end
    total
  end
end

p PerfectNumber.classify(6)
p PerfectNumber.classify(12)
p PerfectNumber.classify(28)
p PerfectNumber.classify(13)