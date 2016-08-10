# OOP Approach

# 1. Write a textual description of the problem
# 2. Extract the major nouns and verbs from the description
# 3. Organize and associate the verbs with the nouns.
# 4. The nouns are the classes and the verbs are the behaviors or methods.

# Textual description:

# Rock, Paper, Scissors is a two-player game where each player chooses one of three 
# possible moves: rock, paper, or scissors. The chosen moves will then be compared to 
# see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# Extract major nouns and verbs:

# Nouns: player, move, rule
# Verbs: choose, compare

# Organize and associate the verbs with the nouns.

# Player
#   - choose
# Move
# Rule

# - compare

# code outline:

# class Player
#   def initialize
#     # maybe a "name"? what aboua a "move"?
#   end

#   def choose

#   end
# end

# class Move
#   def initialize
#     # seems like we need something to keep track of the choice...
#     # a move object can be "paper", "rock" or "scissors"
#   end
# end

# class Rule
#   def iniitialize
#     # not sure what the s"state" of a rule object should be
#   end
# end

# # not sure where "compare" goes yet
# def compare(move1, move2)

# end

# class Player
#   attr_accessor :move

#   def initialize(player_type = :human)
#     @player_type = player_type
#     @move = nil
#   end

#   def choose
#     if human?
#       choice = nil
#       loop do
#         puts "Please choose rock, paper, or scissors:"
#         choice = gets.chomp
#         break if ['rock', 'paper', 'scissors'].include? choice
#         puts "Sorry, invalide choice."
#       end
#       self.move = choice
#     else
#       self.move = ['rock', 'paper', 'scissors'].sample
#     end
#   end

#   def human?
#     @player_type == :human
#   end
# end

# # Orchestration Engine
# class RPSGame
#   attr_accessor :human, :computer

#   def initialize
#     @human = Player.new(:human)
#     @computer = Player.new(:computer)
#   end

#   def display_welcome_message
#     puts "Welcome to Rock, Paper, Scissors!"
#   end

#   def display_goodbye_message
#     puts "Thanks for playing Rock, Paper, Scissors. Good Bye!"
#   end

#   def display_winner
#     puts "You chose #{human.move}"
#     puts "Computer chose #{computer.move}"
#   end

#   def play
#     display_welcome_message
#     human.choose
#     computer.choose
#     display_winner
#     display_goodbye_message
#   end
# end

# RPSGame.new.play

# ________________

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    @name = set_name
  end

  def set_name
    if human?
      name_choice = nil
      loop do
        puts "What is your name?"
        name_choice = gets.chomp
        break unless name_choice.empty?
        puts "Sorry, must enter a value."
      end
      self.name = name_choice
    else
      self.name = ['Luke', 'Harry', 'Gimli', 'Aragon', 'Legolas'].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include? choice
        puts "Sorry, invalide choice."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

# Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
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



















