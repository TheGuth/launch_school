# Exercises: Easy 3

# Question 1. If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi

# prints "Hello"

# case 2:

hello = Hello.new
hello.bye

# error no bye method

# case 3:

hello = Hello.new
hello.greet

# error greet method accepts one argument, and none was given.

# case 4:

hello = Hello.new
hello.greet("Goodbye")

# prints "Goodbye"

# case 5:

Hello.hi

# undefined method since there is no hi class method.

# Question 2. In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# two ways. first could create self.hi or call Hello.new.hi

# Question 3. When objects are created they are a separate realization of a
# particular class.

# Given the class below, how do we create two different instances of this class,
# both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

trinity = AngryCat.new(3, 'trinity')
bob = AngryCat.new(5, 'bob')

# Question 4. Given the class below, if we created a new instance of the class and 
# then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    puts "I am a #{type} cat"
  end
end

# How could we go about changing the to_s output on this method to look like this:
# I am a tabby cat? (this is assuming that "tabby" is the type we passed in
# during initialization).

# have to create a to_s method.

# Question 5. If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new # creates new instance of Television
tv.manufacturer # error no method, because we are calling a class method
tv.model # would call instance method model.

Television.manufacturer # would call class method manufactuere
Television.model # would error no method, because model method is instance.

# Question 6. If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# In the make_one_year_older method we have used self. What is another way we
# could write this method so we don't have to use the self prefix.

# @age

# Question 7. What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a colour of green"
  end
end

# the return key word. and the attr_accessor






















































