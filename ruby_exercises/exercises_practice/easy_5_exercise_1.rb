def ascii_value(string)
  sum = 0
  string.chars.each do |char|
    char_num = char.ord
    sum += char_num
  end
  sum
end

p ascii_value('Four score')
p ascii_value('Launch School')
p ascii_value('a')
p ascii_value('')
