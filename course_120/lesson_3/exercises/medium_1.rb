# Exercises: Medium 1

# Question 1:

# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that 
# you forgot to put the @ before balance when you refer to the balance 
# instance variable in the body of the positive_balance? method."

# {}"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

# Ben is right, becuase he added an attr_reader for the balance instance variable.
# this means that Ruby will automatically create a methoc called balance that 
# returns the value of the @balance instance variable. 

# Question 2: Alyssa created the following code to keep track of items for a 
# shopping cart application she's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(update_quantity)
    # prevent negative qunatities from being set
    quantityt = updated_count if updated_count >= 0
  end
end

# Alan looked at the code and spotted a mistake. "This will fail when update_quantity
# is called", he says.

# can you spot the mistake and how to address it?

# change attr_reader to attr_accessor, and then use the "setter" method like this: 
# self.quantity = updated_count if updated_count >= 0.

# reference the instance variable directly within the update_quantity method, 
# like this @quantity = updated_count if updated_count >= 0

class InvoiceEntry
  attr_accessor :quantity
  attr_reader :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(update_quantity)
    # prevent negative qunatities from being set
    quantityt = updated_count if updated_count >= 0
  end
end

# Question 3: In the last question Alyssa showed Alan this code which keeps
# track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Alan noticed that this will fail when update_quantity is called. Since quantity 
# is an instance variable, it must be accessed with the @quantity notation when 
# setting it. One way to fix this to change attr_reader to attr_accessor.

# is there anyting wrong with fixing it this way?

# this allows us to set the quantity without calling update_quantity if we want
# making the method repetitive, and or cause problems since you now don't have
# to go through update_qunatity method.

# Question 4: Let's practice creating an object hierarchy.

# creata a class called Greeting with a single method called greet that takes a 
# string argument and prints that argument to the terminal.

# Now create two other classes that are derived from Greeting: one called Hello 
# and one called Goodbye. The Hello class should have a hi method that takes no 
# arguments and prints "Hello". The Goodbye class should have a bye method to 
# say "Goodbye". Make use of the Greeting class greet method when implementing the 
# Hello and Goodbye classes - do not use any puts in the Hello or Goodbye classes.

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    "hello"
  end
end

class GoodBye < Greeting
  def bye
    "Goodbye"
  end
end

hi = Hello.new
bye = GoodBye.new

hi.greet(hi.hi)
bye.greet(bye.bye)

# Question 5: You are given the following class that has been implemented:

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
    @combo = nil
    the_doughnut
  end

  def the_doughnut
    @filling_type = "plain" if @filling_type == nil
    @glazing = nil if @glazing == nil
  end

  def combo
    if @glazing == nil
      @combo = "#{@filling_type}"
    else
      @combo = @filling_type + " with " + @glazing
    end
    @combo
  end

  def to_s
    combo
  end
end

# write additonal code for KrispyKreme such taht the puts statements will work 
# as specified below.

# or

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = @filling_type ? @filling_type : "Plain"
    glazing_string = @glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
#  => "Plain"

puts donut2
#  => "Vanilla"

puts donut3
#  => "Plain with sugar"

puts donut4
#  => "Plain with chocolate sprinkles"

puts donut5
#  => "Custard with icing"

# Question 6: If we ahve these two methods:

class Computer
  attr_accessor :template

  def creat_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# what is the difference in the way the code works?

# there isn't one, but we tend to want to avoide self where not required.

# Question 7: How could you change the method name below so that the 
# method name is more clear and less repetitive.

class Light
  attr_accessor :brightness, :color

  def initialize(brightness_level, color_type)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end




















