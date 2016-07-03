# leap Year (Part 1)

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0 
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

p leap_year?(2016)
p leap_year?(2015)
p leap_year?(2100)
p leap_year?(2400)
p leap_year?(240000)
p leap_year?(240001)
p leap_year?(2000)
p leap_year?(1900)
p leap_year?(1752)
p leap_year?(1700)
p leap_year?(1)
p leap_year?(100)
p leap_year?(400)