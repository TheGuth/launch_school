class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
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
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
end
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info

# _____________________________________________________________________

class MyCar
  attr_accessor :year, :color, :model

  def initialize(y, c, m)
    self.year = y
    self.color = c
    self.model = m
  end

  def initial_speed
    @speed = 0
  end

  def speed_up
    @speed += 10
  end

  def brake
    @speed -= 10
  end

  def car_shut_off
    @speed = 0
  end

end

new_car = MyCar.new('2005', 'blue', 'honda')
puts new_car.initial_speed
puts new_car.speed_up
puts new_car.speed_up
puts new_car.speed_up
puts new_car.brake
puts new_car.car_shut_off

class MyCarTwo
  attr_reader :year
  attr_accessor :color

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end
  
  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your new #{color} paint job looks great!"
  end
end  
  
lumina = MyCarTwo.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed
lumina.color = 'black'
puts lumina.color
puts lumina.year
puts lumina.spray_paint('yellow')






