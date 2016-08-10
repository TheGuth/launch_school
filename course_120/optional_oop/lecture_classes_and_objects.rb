# Lecture: Classes and Objects

# 1. Given the below usage of the Person class, code the class definition

class Person
  attr_accessor :name

  def initialize(n)
    @name = n
  end
end

bob = Person.new('bob')
bob.name
bob.name = 'Robert'
bob.name

# 2. Modify the class definition from the above to facilitate the following methods.
#    Note that there is no name= setter method.

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

# bob = Person.new('Robert')
# p bob.name # 'Robert'
# p bob.first_name # 'Robert'
# p bob.last_name # ''
# p bob.last_name = 'Smith' 
# p bob.name # 'Robert Smith'

# 3. Now create a smart name= method that can take just a first name or a full name, and
#    knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
end

# DRY version

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.name
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

# 4. Using the class definition from step #3, let's create a few more people--
#    that is, Person objects

# if we're trying to determine whether the two objects contain the same name, 
# how can we compare the two objects?

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob == rob #false because they have different spaces in memory
p bob.name == rob.name #true because they both share the same string name.

# 5. Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith") 
puts "The person's name is: #{bob}"

# prints out "The person's name is: and the object's bob's space in memory"

puts "The person's name is:" + " #{bob.name}"

# let's add a to_s method to the class

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"










