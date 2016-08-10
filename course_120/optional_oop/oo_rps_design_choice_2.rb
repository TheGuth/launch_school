# oop RPS design choice 2
class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    if 'rock'
      return true if other_move.scissors?
      return false
    elsif 'paper'
      return true if other_move.rock?
      return false
    elsif 'scissors'
      return true if other_move.paper?
      return false
    end
  end

  def <(other_move)
    if 'rock'
      return true if other_move.paper?
      return false
    elsif 'paper'
      return true if other_move.scissors?
      return false
    elsif 'scissors'
      return true if other_move.rock?
      return false
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    set_name
  end
end

class Human < Player
  def set_name
    name_choice = nil
      loop do
        puts "What is your name?"
        name_choice = gets.chomp
        break unless name_choice.empty?
        puts "Sorry, must enter a value."
      end
    self.name = name_choice
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalide choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Luke', 'Harry', 'Gimli', 'Aragon', 'Legolas'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good Bye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
      
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts 'Sorry, must be y or n.'
    end

    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
