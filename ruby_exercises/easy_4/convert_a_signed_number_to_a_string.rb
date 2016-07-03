# Convert a Signed Number to a String!

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

signed_integer_to_string(4321) # == '+4321'
signed_integer_to_string(-123) # == '-123'
signed_integer_to_string(0) # == '0'