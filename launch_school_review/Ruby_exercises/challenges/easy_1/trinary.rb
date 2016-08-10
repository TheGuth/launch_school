# Write a program that will convert a trinary number, 
# represented as a string (e.g. '102012'), to its decimal equivalent using 
# first principles (without using an existing method or library that can work with
# numeral systems).

# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary
# entries should convert to decimal number 0.

# The last place in a trinary number is the 1's place. The second to last is 
# the 3's place, the third to last is the 9's place, etc.

require 'pry'

class Trinary
  def initialize(string_number)
    @numbers = string_number.chars
    @total = 0
  end

  def valid_number
    @numbers.each do |item|
      if item =~ /[a-zA-Z]/
        return true
      end
    end
    return false
  end

  def to_decimal
    valid_number ? 0 : calculate
  end

  def calculate
    @numbers.map { |number| number.to_i }.reverse.each_with_index do |item, index|
      case item
      when 0
        @total += (item*3**index)
      when 1
        @total += (item*3**index)
      when 2
        @total += (item*3**index)
      end
    end
    p @total
  end
end

# or

# class Trinary
#   def initialize(str)
#     @trinary = str
#   end

#   def to_decimal
#     return 0 if invalid_trinary?
#     numbers = @trinary.reverse.chars.map(&:to_i)
#     numbers.each_with_index.map { |num, idx| 3**idx * num }.inject(:+)
#   end

#   private

#   def invalid_trinary?
#     @trinary.match(/[^0-2]/)
#   end
# end

p Trinary.new('0a1b2c').to_decimal

p Trinary.new('carrot').to_decimal

p Trinary.new('1').to_decimal == 1

p Trinary.new('10').to_decimal == 3

p Trinary.new('222').to_decimal == 26

p Trinary.new('1122000120').to_decimal == 32_091

# "102012"
#     1       0       2       0       1       2    # the number
# 1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2 =  302
