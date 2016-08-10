# frozen_string_literal: true
require 'pry'
module Displayable
  def display_welcome_message
    puts "Welcome, #{human.name} to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts '-'.center(62, '-')
    puts "Goodbye, #{human.name}!".center(62, '-')
  end

  def display_score
    puts "#{human.name}'s Score: #{human.score}"
    puts "#{computer.name}'s Score: #{computer.score}"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      human.increment_score
      puts "You won Round: #{round}!"
    elsif human.move < computer.move
      computer.increment_score
      puts "#{computer.name} won Round: #{round}!"
    else
      puts "It's a tie!"
    end
  end

  def display_match_winner
    if human.score > computer.score
      puts "#{human.name} won!"
    elsif computer.score > human.score
      puts "#{computer.name} won!"
    end
  end

  def display_results
    system('clear') || system('cls')
    display_score
    puts "-".center(62, '-')
    puts "Moves For Each Round".center(62, '-')
    history.log.each do |round, moves|
      puts ("Round #{round}:" + "  " \
      "#{human.name} played #{moves[0]} " + "  " \
      "#{computer.name} played #{moves[1]}!").center(62, " ")
    end
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def pause_screen
    puts "Press enter to continue"
    gets
  end

  def convert_move_name(move)
    if move == 'r'
      move = 'rock'
    elsif move == 's'
      move = 'scissors'
    elsif move == 'p'
      move = 'paper'
    elsif move == 'l'
      move = 'lizard'
    elsif move == 'sp'
      move = 'spock'
    else
      move
    end
  end
end

module Winner
  WINNING_SCORE = 5

  def winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
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

  def to_s
    @value
  end

  def >(other_move)
    (rock? && other_move.scissors? || rock? && other_move.lizard?) ||
      (paper? && other_move.rock? || paper? && other_move.spock?) ||
      (scissors? && other_move.paper? || scissors? && other_move.lizard?) ||
      (lizard? && other_move.spock? || lizard? && other_move.paper?) ||
      (spock? && other_move.scissors? || spock? && other_move.rock?)
  end

  def <(other_move)
    (rock? && other_move.paper? || rock? && other_move.spock?) ||
      (paper? && other_move.scissors? || paper? && other_move.lizard?) ||
      (scissors? && other_move.rock? || scissors? && other_move.spock?) ||
      (lizard? && other_move.rock? || lizard? && other_move.scissors?) ||
      (spock? && other_move.lizard? || spock? && other_move.paper?)
  end
end

class History
  attr_accessor :log

  def initialize
    @log = {}
  end

  def record_moves(round, human, computer)
    log[round] = [human, computer]
  end

  def computer_losses
    comp_losses = []
    log.each do |_, move|
      comp_losses << move[1] if move[0] > move[1]
    end
    comp_losses
  end

  def how_many_losing_moves
    hand_losses = Hash.new(0)
    num_losses = []

    computer_losses.each do |v|
      hand_losses[v] += 1
    end
    hand_losses.each_pair do |move, num_times|
      num_losses << [move, num_times]
    end
    num_losses
  end

  def analyze_losses
    dont_pick = []

    how_many_losing_moves.map do |nest|
      if (nest[1].to_f / computer_losses.count) >= 0.5
        dont_pick << nest[0].to_s
      end
    end
    dont_pick
  end
end

class Player
  include Displayable

  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def increment_score
    self.score += 1
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.strip.chomp
      break unless n.empty?
      puts "Sorry, you must enter a name!"
    end
    self.name = n.capitalize
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock(r), paper(p), scissors(s), " \
      "lizard(l), or spock(sp):"
      choice = convert_move_name(gets.strip.chomp)
      break if Move::VALUES.include?(choice.downcase)
      puts "Sorry, that choice was invalid."
    end
    self.move = Move.new(choice.downcase)
  end
end

class Computer < Player
  def set_name
    self.name = ['Tweeter', 'Billy Bob', 'Mox', 'Lance',
                 'Jules', 'Darcy', 'Kilmer'].sample
  end

  def choose(losses)
    self.move = convert_move_name(Move.new(Move::VALUES.sample))
    while losses.include?(move)
      self.move = convert_move_name(Move.new(Move::VALUES.sample))
    end
  end
end

class RPSGame
  include Displayable, Winner

  attr_accessor :human, :computer, :round, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round = 0
    @history = History.new
  end

  def increment_round
    self.round += 1
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.strip.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "That's an invalid choice."
    end
    answer == 'y' ? true : false
  end

  def choose_move
    human.choose
    computer.choose(history.analyze_losses)
  end

  def match
    loop do
      increment_round
      clear_screen
      choose_move
      history.record_moves(round, human.move, computer.move)
      display_moves
      display_round_winner
      display_score
      history.computer_losses
      break if winner?
      pause_screen
    end
  end

  def play
    display_welcome_message
    loop do
      match
      break unless play_again?
    end
    display_results
    display_goodbye_message
  end
end

RPSGame.new.play