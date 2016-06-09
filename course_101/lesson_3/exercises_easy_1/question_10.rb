# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values 
# are the positions in the array.

puts Hash[flintstones.each_with_index.map { |v, i| [i, v] }]

# or

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintsontes_hash[name] = index
end