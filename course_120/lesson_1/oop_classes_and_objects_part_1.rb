# oop_classes_and_objects_part_1.rb


class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weights #{self.weight} and is #{self.height} tall."
  end

end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info

sparky.change_info('Spartacus', '24 inces', '45 lbs')
puts sparky.info


# Exercise 1

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number.to_i
    puts "You speed up to #{@current_speed} mph"
  end

  def brake(number)
    @current_speed -= number
    puts "you brake down to #{@current_speed} mph"
  end

  def spray_paint(color)
    self.color = color
  end

  def shut_the_car_off
    @current_speed = 0
    puts "you park the car, and shut the engine off"
  end
end

speedster = MyCar.new('2013', 'silver', 'Ford')
speedster.speed_up(30)
speedster.brake(20)
speedster.brake(10)
speedster.shut_the_car_off
puts speedster.color
puts speedster.year
speedster.color = 'black'
puts speedster.color
puts speedster.spray_paint('blue')
