# Lecture: Inheritance

# 1. Given this class:

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end  

# teddy = Dog.new
# puts teddy.speak
# puts teddy.swim

# Create a sub-class from Dog called Bulldog overriding the swim method to return
# "can't swim!"

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# bob = Bulldog.new
# p bob.speak
# p bob.swim

# 2. Let's create a few more methods for our Dog class.

class Animal
  def run
    'running'
  end

  def jump
    'jumping'
  end
end

class Dog < Animal
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

# now create a new class called Cat, which can do everything a dog can except 
# swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy
# and paste all methods in Dog into Cat; try to come up with some class hierarchy.

class Cat < Animal
  def speak
    'meow!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

# pete = Animal.new
# kitty = Cat.new
# dave = Dog.new
# bud = Bulldog.new

# pete.run                # => "running!"
# pete.speak              # => NoMethodError

# kitty.run               # => "running!"
# kitty.speak             # => "meow!"
# kitty.fetch             # => NoMethodError

# dave.speak              # => "bark!"

# bud.run                 # => "running!"
# bud.swim                # => "can't swim!"

# 3. Draw a class hierarchy diagram of the classes from step #2

# Animal > Dog > Bulldog
# Animal > Cat

# 4. What is the method lookup path and how is it important?

# method lookup path is the order in which Ruby will traverse the class hierarchy
# to look for methods to invoke.

Bulldog.ancestors # => [Bulldog, Dog, Animal, Object, Kernel, BasicOvject]





















