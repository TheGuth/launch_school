# Lecture: Inheritance

# 1. Give this class: 

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# One problem is that we need to track of different breeds of dogs, since they
# have slightly different behaviors. For example, bulldogs can't swim, but all
# other dogs can.

# Create a sub-class from Dog called Bulldog overriding the swim method to
# return "can't swim"

# class BullDog < Dog

#   def swim
#     "Can't Swim"
#   end
# end

# jimmy = BullDog.new
# puts jimmy.speak
# puts jimmy.swim

# 2. Let's create a few more methods for our Dog class.

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

class BullDog < Dog
  def swim
    "Can't Swim"
  end
end

jimmy = BullDog.new
puts jimmy.speak
puts jimmy.swim

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = BullDog.new

pete.run                # => "running!"
pete.speak              # => NoMethodError

kitty.run               # => "running!"
kitty.speak             # => "meow!"
kitty.fetch             # => NoMethodError

dave.speak              # => "bark!"

bud.run                 # => "running!"
bud.swim                # => "can't swim!"

# 3. Draw a class hierarchy diagram of the classes from step #2

# Pet > Dog > BullDog
# Pet > Cat

# 4. What is the method lookup path and how is it important?

pete.Dog.new
pete.ancestors

# lets us see the path that we take as we look for methods, and where we look
# first 
