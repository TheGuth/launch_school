def prompt(msg)
  puts "=> #{msg}"
end

prompt("What is your name?")
name = gets.chomp

if name[-1] == '!'
  name = name.chop
  prompt("HELLO #{name}. WHY ARE WE SCREAMING?")
else
  prompt("hello #{name}")
end