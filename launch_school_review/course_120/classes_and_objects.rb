# # Lecture Classes and Objects

# # 1. Give the below usage of the Person class, code the class definition.

# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new('bob')
# bob.name                  # => 'bob'
# bob.name = 'Robert'
# bob.name                  # => 'Robert'

# # 2. Modify the class definition from above to facilitate the following methods. 
# # Note that there is no name= setter method now.

# # bob = Person.new('Robert')
# # bob.name                  # => 'Robert'
# # bob.first_name            # => 'Robert'
# # bob.last_name             # => ''
# # bob.last_name = 'Smith'
# # bob.name                  # => 'Robert Smith'

# # Hint: let first_name and last_name be "states" and create an instance method 
# # called name that uses those states.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(n)
#     @name = n
#     @first_name = @name
#     @last_name = ''
#   end

#   def name
#     @first_name + " " + last_name
#   end
# end

# # or

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     parts = full_name.split
#     @first_name = parts.first 
#     @last_name = parts.size > 1 ? parts.last : '' # if parts array is longer than 1 @last_name = parts.last other wise @last_name = ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip #removes whitespaces at the begining and end of a string
#   end
# end


# bob = Person.new('Robert')
# puts bob.name                  # => 'Robert'
# puts bob.first_name            # => 'Robert'
# puts bob.last_name             # => ''
# puts bob.last_name = 'Smith'
# puts bob.name                  # => 'Robert Smith'

# 3. Now create a smart name= method that can take just a first name or a full name,
# and knows how to set the first_name and last_name appropriately.

# bob = Person.new('Robert')
# bob.name                  # => 'Robert'
# bob.first_name            # => 'Robert'
# bob.last_name             # => ''
# bob.last_name = 'Smith'
# bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# bob.first_name            # => 'John'
# bob.last_name             # => 'Adams'

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

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
puts bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

puts bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'

# 4. Using the class definition from step #3, let's create a few more people -- 
# that is, Person objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
# If we're trying to determine whether the two objects contain the same name, 
# how can we compare the two objects?

puts bob == rob # compares the two objects
puts bob.name == rob.name # compares the two objects name values

# 5. Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# prints "The person's name is: (object id) or place in memory"

# See Output
# Let's add a to_s method to the class:

class Person
  # ... rest of class omitted for brevity

  def to_s
    name
  end
end

# Now, what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# prints "The person's name is: Robert Smith"












