def real_palindrome?(string)
  string.to_s.split('').delete_if { |element| element == ('a'..'z') }
  string.to_s.downcase == string.to_s.reverse.downcase
end

p real_palindrome?('madam')
p real_palindrome?('Madam')
p real_palindrome?("Madam, I'm Adam")
p real_palindrome?('356653')
p real_palindrome?('356a653')
p real_palindrome?('123ab321')
puts ""
p real_palindrome?(34543)
p real_palindrome?(123210)
p real_palindrome?(22)
p real_palindrome?(5)
p real_palindrome?(00000)