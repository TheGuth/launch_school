require 'pry'

class Move
  attr_accessor :value

  VALUES = ['rock', 'paper', 'scissors'].freeze

  VALID_CHOICES = { 'rock' => %w(lizard scissors),
                  'paper' => %w(rock sock),
                  'scissors' => %w(paper lizard),
                  'lizard' => %w(spock paper),
                  'spock' => %w(scissors rock) }

  def initialize(value)
    @value = value
  end

  def valid_choice
    VALID_CHOICES.include?(@value)
  end

  def win?(first_move, second_move)
    Move::VALID_CHOICES[first_move.value].include?(second_move.value)
  end

  def to_s
    @value
  end
end

class History
  attr_accessor :move_history

  def initialize
    @move_history = []
  end

  def last_5_moves
    previous_moves = []
    counter = -1
    while counter >= -5
      previous_moves << move_history.slice(counter)
      counter -= 1
    end
    previous_moves.compact
  end

  def log(move) 
    self.move_history << move
  end
end

class Player
  attr_accessor :move, :name, :history

  def initialize
    @move = nil
    set_name
    @history = History.new
  end
end

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
      puts "Please choose rock, paper, scissors, lizard, or spock."
      choice = gets.chomp
      break if Move::VALID_CHOICES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['harry', 'darth vader', 'luke', 'bob'].sample
  end

  def choose
    self.move = Move.new(Move::VALID_CHOICES.keys.sample)
  end
end

class Score
  attr_accessor :score

  POINTS_TO_WIN = 5

  def initialize
    @score = { player: 0, computer: 0 }
  end

  def increment_score(winner)
    if winner == :player
      @score[winner] += 1
    elsif winner == :computer
      @score[winner] += 1
    end
  end

  def reset_score
    @score = { player: 0, computer: 0 }
  end

  def winner?
    if @score[:player] >= POINTS_TO_WIN
      return :player
    elsif @score[:computer] >= POINTS_TO_WIN
      return :computer
    else
      return false
    end
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move.win?(human.move, computer.move)
      puts "#{human.name} won!"
      :player
    elsif computer.move.win?(computer.move, human.move)
      puts "#{computer.name} won!"
      :computer
    else
      puts "It's a tie!"
      :tie
    end
  end

  def display_score
    puts "#{human.name}: #{@score.score[:player]}"
    puts "#{computer.name}: #{@score.score[:computer]}"
  end

  def display_history
    puts "#{human.name} last 5 moves: \n#{human.history.last_5_moves}"
    puts "#{computer.name} last 5 moves: \n#{computer.history.last_5_moves}"
  end

  def winning_message(who_won)
    if who_won == :player
      puts "#{human.name} Wins the Game!!!"
    elsif who_won == :computer
      puts "#{computer.name} Wins the Game!!!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry. must be y o n."
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.history.log(human.choose.value)
        computer.history.log(computer.choose.value)
        display_moves
        @score.increment_score(display_winner)
        display_score
        display_history
        break if @score.winner?
      end
      winning_message(@score.winner?)
      @score.reset_score
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
