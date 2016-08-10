# Write a program that will take a string of digits and give you all the 
# possible consecutive number series of length n in that string.

class Series
  attr_reader :numbers

  def initialize(string)
    @numbers = string.each_char.map(&:to_i)
  end

  def slices(count)
    raise ArgumentError.new('Slice is to long.') if count > numbers.length
    numbers.each_cons(count).to_a
  end
end

# series = Series.new('01234')
# p series.slices(1)
# series = Series.new('01234')
# p series.slices(2)
# series = Series.new('982347')
# p series.slices(3)
# series = Series.new('01234')
# p series.slices(6)

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234

# And the following 4-digit series:

# - 0123
# - 1234

# And if you ask for a 6-digit series from a 5-digit string, 
# you deserve whatever you get.

