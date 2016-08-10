# Lecture: Collaborator Objects

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

joe = Person.new("Joe")
joe.name

# ________________

class Person
  def initialize
    @heroes = ['Superman', 'Spiderman', 'Batman']
    @cash = {'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' => 2, 'hundreds' => 0}
  end

  def cash_on_hand
    # this method will use @cash to calculate total cash value
    # we'll skip the implementation
  end

  def heroes
    @heroes.join(', ')
  end
end

joe = Person.new
joe.cash_on_hand
joe.heroes

# _________________

class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Robert")
bud = Bulldog.new

bob.pet = bud
bob.pet
bob.pet.class

bob.pet.speak
bob.pet.fetch

# _________________

class Person
  attr_accessor :name, :pets

  def initiialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets
bob.pets.each do |pet|
  pet.jump
end































