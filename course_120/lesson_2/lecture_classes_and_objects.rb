# Lecture: Classes and Objects

# 1. Give the below usage of the person class code the class definition

# class Person
#   attr_accessor :name

#   def initialize(n)
#     @name = n
#   end
# end

# bob = Person.new('bob')
# puts bob.name
# bob.name = 'Robert'
# puts bob.name

# 2. Modify the class definition from above to facilitate the following methods.
#    Note that there is no name= setter method now.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first
#     @last_name = parts.size > 1 ? parts.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end
# end

# bob = Person.new('Robert')
# puts bob.name
# puts bob.first_name
# puts bob.last_name
# bob.last_name = 'Smith'
# puts bob.name

# 3. Now create a smart name= method that can take just a first name or a 
#    full name, and knows how to set the first_name and last_name appropriately.

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
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'

# 4. Using the class definition from step #3 let's create a few more people
#    that is, Person objects. 

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name

# 5. Continuing with our Person class definition, what does the below print 
#    out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# prints out the object's place in memory.






















