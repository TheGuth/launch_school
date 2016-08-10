# oop_rps_design_choice_1.rb

# game flow:

# 1. the user makes a choice
# 2. the computer makes a choice
# 3. the winner is displayed

# The Classical appraoch to object oriented programming is:

# 1. Write a textual description of the problem or exercise
# 2. Extract the major nouns and verbs from the description.
# 3. Organize and associate the verbs with the nouns.
# 4. The nouns are the classes and the verbs are the behaviors or methods

# Rock, Paper, Scissors is a two-player game where each player chooses one of three
# possible moves: rock, paper, or scissors. The chosen moves will then be compared
# to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# Nouns: player, move, rule
# verbs: choose, compare

# player - choose
# move
# rule

# - compare

# first attempt at outline

# class Player
#   def initialize
#     # maybe a "name"? what about a "move"
#   end

#   def choose

#   end
# end

# class Move
#   def initialize
#     # seems like we need something to keep track
#     # of the choice... a move object can be "papr", "rock", or "scissors"
#   end
# end

# class Rule
#   def initialize

#   end
# end

# def compare(move1, move2)

# end
# # Game Orchestration Engine
# class RPSGame
#   def initialize
#     @human = Player.new
#     @computer = Player.new
#   end

#   def play
#     display_welcome_message
#     human_choose_move
#     computer_choose_move
#     display_winner
#     display_goodbye_message
#   end
# end

# RPSGame.new.play

# player class
class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

# human_player
class Human < Player
  def set_name
    n = ""
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter a value."
      end
      self.name = n
  end

  def choose
    choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include? choice
        puts "Sorry, invalid choice."
      end
      self.move = choice
  end
end

# computer_player
class Computer < Player
  def set_name
    self.name = ['bobby', 'jim', 'Darth Vader'].sample
  end

  def choose
    self.move = ['rock', 'paper', 'scissors'].sample
  end

end

# Game Orchestration Engine
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
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    end
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
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























