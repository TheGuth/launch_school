# Variable Scope

# variable scoping rules for instance & class variables & constants.

# Instance Variable Scope:

# @variable = Instance variable

# instance variables are used to track individual object state, and do not cross
# between objects.

class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect
puts joe.inspect

bob.get_name

# ______________________
# accessing an instance variable that is not yet initialized anywhere

class Person
  def get_name
    @name
  end
end

bob = Person.new
bob.get_name   # => nil

# instance variable at the class level?

class Person
  @name = "bob"  # class level initialization

  def get_name
    @name
  end
end

bob = Person.new
bob.get_name   # => nil

# Class Variable Scope

# @@variable = class variable

# two main behaviors:

# 1. all objects ahre 1 copy of the class variable (This also implies objects
#    can access class variables by way of instance methods.)

# 2. class methods can access class variables, regardless of where it's initialized.

# Example:

class Person
  @@total_people = 0  # initialized a class variable at class level

  def self.total_people
    @@total_people    # accessible from class method
  end

  def initialize
    @@total_people += 1 # mutable from instance method
  end

  def total_people
    @@total_people # accessible from instance method
  end
end

Person.total_people
Person.new
Person.new
Person.total_people

bob = Person.new
bob.total_people

joe = Person.new
joe.total_people

Person.total_people

# Constant Variable Scope

class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  attr_reader :name

  def self.titles
    TITLES.join(', ')
  end

  def initialize(n)
    @name = "#{TITLES.sample} #{n}"
  end
end

Person.titles

bob = Person.new('bob')
bob.name


























