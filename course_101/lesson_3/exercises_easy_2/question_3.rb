#In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).

ages.each_pair do |key, value|
  if value >= 100
    ages.delete(key)
  end
end
puts ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.delete_if { |key, value| value >= 100 }

puts ages.keep_if { |k, age| age < 100 }
