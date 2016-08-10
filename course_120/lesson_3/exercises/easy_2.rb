# Exercises: Easy 2

# Question 1: You are five the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling

oracle = Oracle.new # creates a new instance object of class Oracle
oracle.predict_the_future # doesn't print anything to the screen, but will
                          # "You will " and one of the choices.

# Question 2: We have an Oracle class and a RoadTrip class that inherits from
# the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

What is the result of the following

trip = RoadTrip.new     # creates a new instance objectof class RoadTrip
trip.predict_the_future # Since class RoadTrip has inherited from Oracle, objects
# from the class of RoatTrip can use Oracle methods. This is why RoadTrip can use
# predict_the_future, which will then use RoatTrip method choices instead of Oracle

# Question 3: How do you find where Ruby will look for a method when that 
# method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

tobasco = Hotsauce.new
tobasco.ancestors
Orange.ancestors

# Question 4: What could you add to this class to simplify it and remove two
# methods from the class definition while still maintaining the same funcionality?

# before
class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# after
class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

# you can use the shortcut attr_accessor to create a getter, and setter method
# for any instance variables. You can also use attr_reader for only getter, and
# attr_writer for only setter.

# Question 5: There are a number of variables listed below. What are the 
# different types and how do you know which is which?

excited_dog = "excited dog"  # local variable
@excited_dog = "excited dog" # instance variable
@@excited_dog = "excited dog" # class variable

# you can tell what type of variable is being used by the @ symbol. if there are
# no @ symbol, its a local variable, if there is one @ symbol. It is an
# instance variable, and if it has two @ symbols then it's a class variable.

# Question 6: If i have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know?
# How would you call a class method?

# self.manufactuere is a class method while model is a normal method.
# to call a class method you prepend self in front of the method name.

# Question 7: If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and hot it works. 
# What code would you need to write a test theory?

# @@cats_count is a class variable, and is keeping track of all
# @@cats_count objects. Everytime we initialize an instance of Cat
# we increment our @@cats_count by 1. This way we can keep track of how
# many Cat instances we have.

Cat.cats_count
trinity = Cat.new('shorthair')
bob = Cat.new('longhair')
Cat.cats_count

# Question 8: If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method
# from the Game class?

# we can add < Game which tells Bingo to inherit any methods from Game.

game_of_bingo = Bingo.new
game_of_bingo.play

# Question 9: If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    # rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind
# that there is already a method of this name in the Game clas that the Bingo
# class inherits from.

# If add a play method to the Bingo class it will be called over the Game class
# play method, since when we calla method it will check inside the Bingo class first

# Question 10: What are the benefits of using Object Oriented Programming in Ruby?
# Think of as many as you can.

# The major benefit is being able to make reusable code snippits, and as we build
# increasingly more complex programs. We can make changes and edits more easily
# since our code is more modular.

# 6 benifits of using OOP

# 1. Creating objects allow programmers to think more abstractly about the code they
# are writing

# 2. Objects are represented by nouns so are easier to conceptualize.

# 3. It allows us to only expose functionality to the parts of code that need it,
# meaning namespace issues are much harder to come across.

# 4. It allows us to easily give functionality to different parts of an
# application without duplication.

# 5. We can build applications faster as we can reuse pre-written code.

# 6. As the software becomes more complex this complexity can be more
# easily managed.
















