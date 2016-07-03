def short_long_short(string_1, string_2)
  if string_1.length > string_2.length
    puts string_2 + string_1 + string_2
  else
    puts string_1 + string_2 + string_1
  end
end

short_long_short('abc', 'defgh')
short_long_short('abcde', 'fgh')
short_long_short('', 'xyz')