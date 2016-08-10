require 'pry'
# frozen_string_literal: true

class History
  attr_accessor :log, :move_number

  def initialize
    @log = []
    @move_number = 0
  end

  def lost_move
    if lost?
      if last_round[:winner] == :computer_value
        last_round[:human_move]
      else
        move_with_most_loses
      end
    end
  end

  def current_game_logs
    logs.last_round
  end

  def <<(log)
    log.last << log
  end

  def reset_round
    logs << []
  end

  private

  def filter_rounds(winner)
    logs.flatten.select do |log|
      log[:winner] == winner
    end
  end

  def count_rounds(rounds)
    count = Hash.new(0)
    rounds.each do |round|

  def set_history(choice)
    @move_number += 1
    @log[@move_number] = choice
    @log
  end

  def to_s
    @log
  end
end

class Move
  VALUES = %w(rock paper scissors lizard spock).freeze

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

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.spock? || other_move.paper?)) ||
      (spock? && (other_move.rock? || other_move.scissors?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (lizard? && (other_move.rock? || other_move.scissors?)) ||
      (spock? && (other_move.lizard? || other_move.paper?))
  end

  def to_s
    @value
  end
end

# player class
class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name
    @history = History.new
    @score = 0
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
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end

  def increment_score
    @score += 1
  end
end

# computer_player
class Computer < Player
  def set_name
    self.name = ['bobby', 'jim', 'Darth Vader'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  def increment_score
    @score += 1
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
    puts "Welcome to Rock, Paper, Scissors, Lizard, and Spock!"
    puts "First one to 10 wins, Wins the Game!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, & Spock. Good Bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_history
    sleep(3)
    system "clear"
    human_value = "#{human.move}"
    computer_value = "#{computer.move}"
    puts "#{human.name} move history: \n #{human.history.set_history(human_value)}"
    sleep(2)
    puts "#{computer.name} move history: \n #{computer.history.set_history(computer_value)}"
    sleep(2)
  end

  def display_winner
    if human.move > computer.move
      human.increment_score
      puts "#{human.name} won!"
    elsif human.move < computer.move
      computer.increment_score
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def score_keeper?
    if human.score >= 10 || computer.score >= 10
      return true
    else
      return false
    end
  end

  def display_score
    puts ""
    puts "#{human.name} score is: #{human.score}"
    puts "#{computer.name} score is: #{computer.score}"
    puts ""
  end

  def score_reset
    human.score = 0
    computer.score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      score_reset
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_history
        display_score
        break if score_keeper?
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
