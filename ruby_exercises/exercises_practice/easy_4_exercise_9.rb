DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    p remainder
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

integer_to_string(4321)
integer_to_string(0)
integer_to_string(5000)
