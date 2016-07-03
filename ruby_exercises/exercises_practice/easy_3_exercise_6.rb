# Write a method named xor that takes two arguments, and returns true if
# exactly one of its arguments is true, false otherwise

def xor?(arg_1, arg_2)
  if arg_1 == true && arg_2 == false
    true
  elsif arg_1 == false && arg_2 == true
    true
  else
    false
  end
end

p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?)
p xor?(5.odd?, 4.even?)
p xor?(5.even?, 4.odd?)

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

def xor?(value1, value2)
  (value1 && !value2) || (value2 && !value1)
end