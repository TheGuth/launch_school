# class GoodDog
#   @@number_of_dogs = 0

#   def initialize
#     @@number_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
# end

# puts GoodDog.total_number_of_dogs

# dog1 = GoodDog.new
# dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age  = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years"
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky.age

# puts sparky
# p sparky

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weights #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end
end

sparky = GoodDog.new('Sparky', '12 inces', '10 lbs')
p sparky.what_is_self

class MyAwesomeClass
  def self.this_is_a_class_method
  end
end

# Exercises 1-3

class MyCar
  def self.gas_milage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

MyCar.gas_milage(13, 351)


class MyCar
  # code omitted for brevity...

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car  # => My car is a silver, 2010, Ford Focus.

## Note the "puts" calls "to_s" automatically.


