# Add up all of the ages from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


total_age = 0
ages.each_value do |value|
  total_age = total_age + value
end

puts total_age

# or 

ages.values.inject(:+)