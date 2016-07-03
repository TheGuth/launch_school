# class GoodDog
#   attr_accessor :name, :height, :weight

#   def self.what_am_i
#     "I'm a GoodDog class!"
#   end

#   def initialize(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def speak
#     "#{name} says Arf!"
#   end

#  def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end
# end
# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.info

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info

# # _____________________________________________________________________

# puts GoodDog.what_am_i

# class GoodDogTwo
#   @@number_of_dogs = 0

#   def initialize
#     @@number_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
# end

# puts GoodDogTwo.total_number_of_dogs

# dog1 = GoodDogTwo.new
# dog2 = GoodDogTwo.new

# puts GoodDogTwo.total_number_of_dogs

# _________________________________________________________________________

# class GoodDog
#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   def initialize(n, a)
#     self.name = n
#     self.age = a * DOG_YEARS
#   end

#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
# end

# sparky = GoodDog.new("Sparky", 4)
# puts sparky.age
# puts sparky
# p sparky

# ________________________________________________

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
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

sparky = GoodDog.new('sparky', '12 inches', '10 lbs')
p sparky.what_is_self




