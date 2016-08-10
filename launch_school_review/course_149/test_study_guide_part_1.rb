# Part 1: Test Study Guide

some Vocab:

# Encapsulation-- is hiding pieces of functionality and making it unavailable to the 
# rest of the code base.

# Polymorphism-- is the ability for data to be represented as many different types. 
# "Poly" stands for "many" and "morph" stands for "forms". OOP gives us flexibility 
# in using pre-written code for new purposes.

120 - Object Oriented Programming

1. # classes and objects

# Ruby defines the attributes and behaviors of its objects in classes.
# classes are basic outlines of what an object should be made of and what it should be
# able to do.

class Name

end
james = Name.new # Instance of Name class. james is now an object of the Name class.

# instantiation - the entire worflow of creating a new object or instance from a class.

# States track attributes for individual objects. Behaviors are what objects 
# are capable of doing.

2.# using attr_* to automatically create setter and/or getter methods, 
  # and how to call them

attr_reader :name # allows only a getter method of the instance variable @name
attr_writer :name # allows only a setter method of the instance variable @name
attr_accessor :name # creates both a getter and setter method of the instance variable @name

3.# instance methods vs class methods
class Hello
  def hello # instnace method can only be performed on an object.

  end
  def self.hello # class method can only be performed on the class.
                 # self.hello is really Hello.hello. self is the class itself.
  end

  @variable  # instance variable exists as long as an instant of the class exists for
             # that particular object.
  @@variable # class variable pretains to the class

end

4.# referencing and setting an instance variable vs using getter/setter methods

    

5.# class inheritance

  class Animal # superclass
    def speak
    end
  end

  class Dog < Animal # class Dog inherits behaviors/methods from superclass Animal
  end                # this allows objects of the Dog class to call on methods in 
                     # the Animal class. however if class Dog has a method of the 
                     # same name as its superclass ruby will override and use the 
                     # method from the Dog class over Animal. same for modules.

  super # allows us to call methods up the inehritance hierarchy. WHen  you call
        # super from within a method, it will search the inheritance hierarchy for
        # a method by the same name and then invoke it.

Bonus. Inheritance vs modules

  # You can only subclass from one class. But you can mix in as many modules as 
  # you'd like.

  # If it's an "is-a" relationship, choose class inheritance. If it's a "has-a" 
  # relationship, choose modules. Example: a dog "is an" animal; a dog "has an" 
  # ability to swim.

  # You cannot instantiate modules (i.e., no object can be created from a module) 
  # Modules are used only for namespacing and grouping common methods together.


6.# mixing in module
module Hello # module is a collection of behaviors that is useable in other classes
  def speak  # via mixins. A module is mixed in to a class using the include reserved
             # wrod
  end
end

class Person
  include Hello # mixed in the module Hello to the class Person. So now instances of
end             # class Person have access to the speak method in the module Hello.

7.# method lookup path
  Person.ancestors # (Person, Hello, Object, Kernel, BasicObject) lookup path.
  # gives us the lookup path that ruby uses when searching for method
  # calls. the method ancestors can be used on any class to find out
  # the method lookup chain. 

8.# self

# self is a way of being explicit about what our program is referencing and what our
# intentions are as far as behavior. self changes depending on the scope it's defined
# in, whether it is defined inside or ousiide a method.

9.# calling methods with self

  def self.hello # class method self represents the class would be like GoodDog.hello
  end

10.# more about self

# self, inside of an instance method, references the instance (object) 
# that called the method - the calling object. Therefore, self.weight= 
# is the same as sparky.weight=, in our example.

# self, outside of an instance method, references the class and can be used to 
# define class methods. Therefore, def self.name=(n) is the same as 
# def GoodDog.name=(n), in our example.

11.# being able to read OO code

12.# fake operators

  # When using the fake operator methods for our own objects, we must be careful to 
  # follow conventions established in the Ruby Standard Library, otherwise, using those
  # methods will be very confusing.

#   Method  Operator  Description
# yes | [], []=       | Collection element getter and setter.
# yes | **            | Exponential operator
# yes | !, ~, +, -    | Not, complement, unary plus and minus (method names for the last two are +@ and -@)
# yes | *, /, %       | Multiply, divide, and modulo
# yes | +, -          | Plus, minus
# yes | >>, <<        | Right and left shift
# yes | &             | Bitwise "and"
# yes | ^, |          | Bitwise inclusive "or" and regular "or"
# yes | <=, <, >, >=  | Less than/equal to, less than, greater than, greater than/equal to
# yes | <=>, ==, ===,
#       !=, =~, !~    | Equality and pattern matching (!= and !~ cannot be directly defined)
# no  | &&            | Logical "and"
# no  | ||            | Logical "or"
# no  | .., ...       | Inclusive range, exclusive range
# no  | ? :           | Ternary if-then-else
# no  | =, %=, /=, -=,
#      +=, |=, &=, >>=,
#      <<=, *=, &&=, ||=,
#      **=, {         | Assignment (and shortcuts) and block delimiter


13.# truthiness

  # Everything in Ruby is considered "Truthy" except for false and nil

  # We can use any expression in a conditional, or with logical operators, and as
  # long as it doesn't evaluate to false or nil, it is considered true.

  # example: 
  num = 5

  if num # is a truthy value,
    puts "valid number"
  else
    puts "error"
  end
  # outputs valid number
  num == true # false num is truthy but not equal to true

14.# working with collaborator objects

  # collaborator objects are using objects within another class.
  class Person
    attr_accessor :pets
    def initialize(name)
      @pets = []
    end
  end

  class Dog
    def speak
    end
  end

  james = Person.new # instanciation of a new object from class Person
  roland = Dog.new  # instanciation of a new object from class Dog
  james.pets 
  james.pets << roland # Dog object add to the pets array in side the object James.
  james.pets[0].speak # can use collaborator objects to call on their methods.

Bonus. Private, Protected, and Public

public methods --# is a method that is available to anyone who knows either the class
                 # name or the object's name.

private methods --# private methods are not accessible outside of the class definition
                  # at all, and are only accessible from inside the class when called
                  # without self.

protected methods --# from outside the class, protected methods act just like private
                    # methods.
                    # from inside the class, protected methods are accessible just
                    # like public methods.

130 - Ruby Foundations: More Topics

16.# how blocks work, and when we would want to use them

# blocks are one way that Ruby implements closures. Closures are a way to pass 
# around an unnamed "chunk of code" to be executed later.

# blocks can take arguments, just like normal methods. But unlike normal methods, 
# it won't complain about wrong number of arguments passed to it.

# blocks return a value, just like normal methods.

# blocks are a way to defer some implementation decisions to method invocation time.
# It allows method callers to refine a method at invocation time for a specific use
# case. It allows method implementors to build generic methods that can be used in 
# a variety of ways.

# blocks are a good use case for "sandwich code" scenarios, like closing a 
# File automatically.

  yield keyword, 
  block_given?

  1. defer some implementation code to method invocation decision
  2. methods that need to perform some "before" and "after" actions - sandwhich code.

17.# how to implement your own each, select, reduce, and map in a custom collection-oriented class

# each
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])                           # yield to the block, passing in the current element to the block
    counter += 1
  end

  array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

# select
def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end

# reduce
def reduce(array, default=0)
  counter = 0
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

# times
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number                      # return the original method argument to match behavior of `Integer#times`
end

# map 

def map(array)
  return array if array.empty?
  new_array = []
  array.each do |item|
    new_array << yield(item)
  end
  new_array
end

# or 

def map(array)
  result = []
  array.each { |item| result << yield(item) }
  result
end

# count 

