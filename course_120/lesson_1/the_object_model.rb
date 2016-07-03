
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

sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!")

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts"---HumanBeing ancestors---"
puts HumanBeing.ancestors


module Say
  def say(string)
    puts "#{string}"
  end
end 

class Programmer
  include Say
end

james = Programmer.new

james.say("hello")