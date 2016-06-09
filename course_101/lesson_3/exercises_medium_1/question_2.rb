# Question 2

# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"


# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a # creates two arrays A to Z and a to z
letters.each do |letter| # iterates over each letter
  letter_frequency = statement.scan(letter).count # scans the frequency of each letter for statement
  result[letter] = letter_frequency if letter_frequency > 0 
  # adds the current letter to the key, and then if letter has frequency
  # of more than 0 then it is added to the value of that letter
  # other wise it doesn't add anything to the hash if it has 0 occurences.
end

puts result