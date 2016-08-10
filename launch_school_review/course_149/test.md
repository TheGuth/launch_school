### Question 1: Explain the relationship between classes and objects. Use code to illustrate your explanation.

Ruby defines the attributes and behaviors of it's objects in classes. Meaning
That Classes are like molds or basic outlines of what an object should be made
of and what it should be able to do. for example.

```ruby
class Person 
  def speak
    puts "Hello"
  end
end

bob = Person.new # We Instantiate a new object from our class Person,
tom = Person.new
jim = Person.new
Bob.speak
tom.speak # all instances or objects of the Person class have the behaviors or
jim.speak # methods that are within the Person class.
```

This code example shows us that classes act as outlines for the creation of
instances or objects of that particular class. When we created a new instance
of the Person class. that instance has access to all of the behaviors or methods that are made available inside the Person class.

### Question 2. Explain what class inheritance is. Use code to illustrate your explanation.

class inheritance is the concept of creating a hierarchy of relationships between classes. For instance we may have a class Dog, and a class Cat. These two classes may share some behaviors and knowing this we could take those similar behaviors and put them into a superclass Animal. Now we can have class Dog and class Cat inherit from class Animal allowing them access to the behaviors that Animal has. This allows us to dry up our code, so that we don't have to repeat ourselves for multiple classes that share a relationship.

example in code:

```ruby
class Animal # superclass that we will inherit behaviors from 
  attr_reader :name

  def initialize(name, type)
    @name = name
    @type = type
  end

  def run
    "I'm a running #{name}"
  end
end

class Dog < Animal           # class Dog inherits from from superclass Animal
  def initialize(name, type)
    super                    # super calls the method of the same name in the 
  end                        # superclass Animal, so we don't have to repeat
end                          # ourselves.

class Cat < Animal
  def initialize(name, type)
    super
  end
end

kitty = Cat.new # create new instance/object of class Cat
puppy = Dog.new # create new instance/object of class Dog
kitty.run # we inherit the run method from the superclass Animal
puppy.run # we inherit the run method from the superclass Animal
```

### Question 3. How does Ruby handle the problem of multiple inheritance? Explain how this modifies the method lookup chain. Use code to illustrate.

Ruby doesn't allow one class to inherit from multiple super classes. However you can have something like this: class dalmation Inherits from class Dog which inherits from class Animal and so on. However, you can not directly have class Dog inherit from two different classes at the same time. 

The way Ruby handles this problem is through mixins or modules. A module is a collection of behaviors that is useable in other classes via mixins. A module is mixed in to a class using the include reserved word, which then allows that class to use the behaviors or methods of that module. There is no limit to how many modules a class can have. 

The method lookup chain which can be called using the ancestors method, allows us to see how Ruby finds a method that we are wanting to use. Here is an example:

```ruby

module Home_Owner
  def property_tax
    "you have to pay property_tax"
  end
end

class HumanBeing
  def human
    "I'm human"
  end
end

class Person < HumanBeing
  include Home_Owner # includes the module so we can use the behaviors it has.
  def initialize(name)
    @name = name
  end  
end

jim = Person.new
jim.property_tax # can call the method property_tax since we have included 
                 # the module Home_Owner.

Person.ancestors # Person, Home_Owner, HumanBeing, object, Kernel, BasicObject
```

So when we use the method lookup we can see that it always checks our initial class first, then the modules, and then the superclass, and continues down through the object, kernel, BasicObject.

### Question 4. What's the difference between a class and a module?

a module you cannot instantiate objects from, modules can only be used for namespacing and grouping common methods together, Where as a class we can instantiate objects and allows us to dictate what those objects will have access to when they are instantiated.

### Question 5. What's the whole point of Object Oriented Programming? Pros and cons of OOP

OOP is suppose to help us deal with more complext problems, and allow us to make changes to a code base without it having a ripple effect to the rest of the code base. OOP allows us to create sections of code so that we can more easily work on a code base without having major changes to the rest of the code base. OOP also allows us to think more abstractly as we can use objects to represent the real_world. OOP allows for encapsulation and makes it easier to work on a code base as a team, where as if you have a giant blob of code any change by any team member could throw everything into chaos. Another thing OOP is great for is reusability.

Some cons to OOP are up to debate, but requires more planning, when starting a project. OOP Requires very accurate documentation, but that should be the case with all programs. The biggest draw back to me is the planning, and extra layer of abstrac thinking.

### Question 6. What does the phrase "OO Design" mean?

OO design is the idea of planning a system of interacting objects to solve a problem. Usually through braking up the problem into manageable code chunks in our case classes. 

### Question 7. Explain why the last line in the below code outputs "bob". What are two possible ways to fix the change_info method so that it executes correctly?

```ruby
class Person
    attr_accessor :name

    def initialize(n)
      @name = n
    end

    def change_info(new_name)
        name = new_name         # self.name = new_name
    end
  end

  bob = Person.new('bob')
  bob.change_info('Robert')

  puts bob.name
```
We are not invoking the setter method, but are in fact creating a new variable name. In order to fix this code we need to put self.name or @name.

### Question 8. Use the Person class below, and create a class method called total_people, and have it return the total number of Person objects created.

```ruby
  class Person
    @@number_of_people = 0
    def initialize(name, weight, height)
      @name = name
      @weight = weight
      @height = height
      @@number_of_people += 1
    end

    def self.total_people
      @@number_of_people
    end
  end

  bob = Person.new('bob', 185, 70)
  Person.total_people       # this should return 1
```

### Question 9. Take the answer from the question above, and add a getter/setter for name, weight and height.

```ruby
  class Person
    attr_accessor :name, :weight, :height

    @@number_of_people = 0
    def initialize(name, weight, height)
      @name = name
      @weight = weight
      @height = height
      @@number_of_people += 1
    end

    def self.total_people
      @@number_of_people
    end
  end

  bob = Person.new('bob', 185, 70)
  Person.total_people       # this should return 1
  bob.name
  bob.weight
  bob.height
```

### Question 10. Continuing on from the answer in the previous question, add a change_info(name, weight, height) instance method that can modify the object's 3 attributes all at once. Use the setter methods (as opposed to referencing the instance variables directly).

```ruby
  class Person
    attr_accessor :name, :weight, :height

    @@number_of_people = 0
    def initialize(name, weight, height)
      @name = name
      @weight = weight
      @height = height
      @@number_of_people += 1
    end

    def self.total_people
      @@number_of_people
    end

    def change_info(n, w, h)
      self.name = n
      self.weight = w
      self.height = h
    end
  end

  bob = Person.new('bob', 185, 70)
  Person.total_people       # this should return 1
  bob.change_info('jim', 200, 25)
  bob.name
  bob.weight
  bob.height
```
### Question 11. Looking at the final code of the previous question, describe why self can be used both to define a class method and invoke an instance method. Explain how self works here.

self is a way of being explicit about what our program is referencing and what our intentions are as far as behavior is. Self changes depending on the scope it's defined in, whether it is defined inside or outside a method. 

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.hello # references a class method, were really calling
  end            # Person.hello and calling the method on the class.

  def hello
    "#{self.name} says hello" # self.name in this case is referencing the
  end                         # object.name 
end
```

### Question 12. This exercise will ask that you come up with a class design for a fake "Employee Management Application".

```ruby

class Employee_Management_Application
  def initialize
    @Employees = []
  end
end

module Delegate_Work
  def delegate
    "I may delegate work"
  end
end

class Employee
  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
    @full_or_part_time = full_or_part_time
    @vacation_days = vacation_time
    @desk = work_space
  end

  def info
     puts "name: #{name}"
     puts "serial number: #{@serial_number}"
     puts "full or part time: #{@full_or_part_time}"
     puts "Vacation days: #{@vacation_days}"
     puts "Desk: #{@desk}"
     puts ""
  end

  def full_or_part_time
    if self.class == Executive || self.class == Manager || self.class == Regular_Employee
      "Full Time"
    else
      "Part Time"
    end
  end

  def work_space
    if self.class == Executive
      "corner office"
    elsif self.class == Manager
      "regular private office"
    elsif self.class == Regular_Employee
      "desk in cubicle farm"
    else
      "open workspace (no reserved desk)"
    end
  end

  def vacation_time
    if self.class == Executive
      20
    elsif self.class == Manager
      14
    elsif self.class == Regular_Employee
      10
    else
      0
    end
  end

  def name
    if self.class == Executive
      "Exe #{@name}"
    elsif self.class == Manager
      "Mgr #{@name}"
    else
      "#{@name}"
    end
  end
end

class Executive < Employee
  include Delegate_Work

  def initialize(name, serial_number)
    super
  end
end

class Manager < Employee
  include Delegate_Work

  def initialize(name, serial_number)
    super
  end
end

class Regular_Employee < Employee
  def initialize(name, serial_number)
    super
  end
end

class Part_time_Employee < Employee
  def initialize(name, serial_number)
    super
  end
end


bob = Executive.new('bob', 123)
tom = Manager.new('tom', 589)
jim = Regular_Employee.new('jim', 748)
tim = Part_time_Employee.new('tim', 238)
p bob.name
bob.info
p tom.name
tom.info
p jim.name
jim.info
p tim.name
tim.info

p bob.delegate
p tom.delegate

```




### Blocks

### Question 1. Explain what a closure is, and why do we say that it's at the core of understanding local variable scope?

A clsoure is a concept that allows us to save a chunk of code and execute it at a later time. Closures bind to their surrounding artifcats variables, methods and objects, and build an enclosure around everything so that they can be referenced when the closure is later executed. Which seems to violate what we know of local variable scope. However this is the core of understanding local variable scope as closures hold on or bind to their surrounding environment.

### Question 2. Explain the 2 major use cases for implementing a method that can take a block. Use code to illustrate your explanation.

1. to defer some implementation code to method invocation decision
2. methods that need to perform some "Before" and "after" actions or sandwhich code. 

```ruby
def compare(str, flag)
  after = case flag
  when :upcase
    str.upcase
  when :capitalize
    str.capitalize
  end

  puts "Before: #{str}"
  puts "After: #{str}"
end

compare("hello", :upcase) 
```

defers some implementation code to method invocation or you could do 

```ruby
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end
```

difers implementation to the method invocation.

```ruby
File.open("some_file.txt", "w+") do |file|
  # write to this file using file.write
end
```

sandwhich code where you open and close a file

### Testing

### Question 1. What's the difference between MiniTest and RSpec?

both allow you to do testing, minitest is the default testing library for Ruby. The major difference is that MiniTest syntax is more straightforward because it reads just like ruby, where RSpec trys to read more English, and is a DSL or Domain Specific Language, other than that they are both testing libraries.

### Question 2. Explain what assert_equal does. How does it test for equality?

assert_equal(value_1, value_2) checks if value 1 is equal to value 2, it checks for eaulity through the == sign. 






















