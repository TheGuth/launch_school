# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

# flintstones.each do |value| 
#   if value.start_with?('Be')
#     puts value
#   end
# end

# puts flintstones.select { |name| name.start_with?('Be') }

puts flintstones.index { |name| name[0, 2] == "Be" }