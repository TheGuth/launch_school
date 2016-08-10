# good_dog.rb

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors

sparky = GoodDog.new
sparky.speak("Arf")
bob = HumanBeing.new
bob.speak("Hello!")

# Exercise 1 & 2

module Meow
  def meow(sound)
    puts "#{sound}"
  end
end

class MeanCat
  include Meow
end

trinity = MeanCat.new
trinity.meow("meow")

# Exercise 1 & 2 book solution

module Study
end

class MyClass
  include Study
end

my_obj = MyClass.new

