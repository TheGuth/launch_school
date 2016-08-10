# How do we create an object in Ruby? Give an example of the creation of an object

class Programmer
  def coding
    puts "typing"
  end
end

james = Programmer.new
james.coding

# What is a module? what is its purpose? How do we use them with our classes?
# Create a module for the class you created in exercise 1 and include it properly.

module Talking
  def speak(string)
    puts "#{string}"
  end
end

class Programmer
  include Talking

  def coding
    puts "typing"
  end
end

james = Programmer.new
james.coding
james.speak("hello")