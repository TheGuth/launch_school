# Convert a string to a number!

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def strings_to_integers(string)
  digits = string.chars.map { |chars| DIGITS[chars] }
  
  value = 0
  digits.each { |digit| value = 10 * value + digit }

end

p string_to_integer('4321')
p string_to_integer('570')
