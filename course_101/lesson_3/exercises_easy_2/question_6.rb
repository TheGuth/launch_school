# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum_age = 1000
ages.each_value do |value|
  if value < minimum_age
    minimum_age = value
  end
end
puts minimum_age

# or

puts ages.values.min 