# # oop_rps.rb

# # Rock, Paper,Scissors is a two-player game where each player chooses one of three
# # possible moves: rock, paper, or scissors. The chosen move will then be compared 
# # to see who wins, according to the following rules:

# # - rock beats scissors
# # - scissors beats paper
# # - paper beats rock

# # If the players chose the same move, then it's a tie.

# # Nouns: player, move, rules
# # Verbs: choose, compare

# # Player
# #   - choose
# # Move
# # Rule

# # - compare

# class Player
#   def initialize
#     # maybe a "name"? what about a "move"?
#   end

#   def choose

#   end
# end

# class Move
#   def initialze
#     # seems like we need something to keep track of the choice... a move ovject
#     # can be "paper", "rock" or "scissors"
#   end
# end

# class Rule
#   def initialize
#     # not sure waht the "state" of a rule object should be
#   end
# end

# # not sure where "compare" goes yet
# def compare(move1, move2)
  
# end

# RPSGame.new.play

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      n = ""
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter a value."
      end
      self.name = n
    else
      self.name = ['Jimmy', 'Arnold', 'Bob', 'Han Solo', 'Luke skywalker'].sample
    end
    
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include? choice
        puts "sorry, invalid choice."
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
    puts "#{human.name} choose #{human.move}."
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
























