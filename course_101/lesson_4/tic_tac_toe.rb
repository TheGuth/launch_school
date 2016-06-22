# Tic Tac Toe is a 2 player game played on a 3x3 board.
# Each player takes a turn and marks a square on the board.
# First player to reach 3 squares in a row, including diagonals,
# wins. If all 9 squares are marked and no player has 3 squares in
# a row, then the game is a tie.

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. if yes, go to #1
# 10. Good bye!

require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # digonals

FIRST_SQUARE = 5
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WHO_GOES_FIRST = "choose".freeze

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "Your're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, delimiter = ', ', word = 'or')
  if array.length - 1 > 0
    array.join(delimiter).insert(-2, word + ' ')
  else
    array.join('')
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def square_at_risk(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  # offense
  WINNING_LINES.each do |line|
    square = square_at_risk(line, brd, COMPUTER_MARKER)
    break if square
  end
  # defense first
  if !square
    WINNING_LINES.each do |line|
      square = square_at_risk(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if brd[FIRST_SQUARE] == INITIAL_MARKER
    brd[FIRST_SQUARE] = COMPUTER_MARKER
  # random pick
  elsif !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return :player
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return :computer
    end
  end
  nil
end

def increment_score(result, scores)
  if result == nil
    scores
  else
    scores[result] += 1
    scores
  end
end

def winner?(scores)
  if scores[:player] >= 5
    :player
  elsif scores[:computer] >= 5
    :computer
  else
    false
  end
end

def place_piece!(board, current_player)
  if current_player == 0
    player_places_piece!(board)
  elsif current_player == 1
    computer_places_piece!(board)
  end
end

# rubocop is saying that current_player = 1, and cureent_player = 0
# are useless assignments, but they are neccessary.
def alternate_player(current_player)
  if current_player == 0
    current_player = 1
  elsif current_player == 1
    current_player = 0
  end
end

# Main game loop
loop do
  prompt "Welcome to Tic Tac Toe"
  prompt "First player to score 5 wins the game!"
  prompt "Who would you like to go first?"
  prompt "Enter 0 for player: Enter 1 for Computer"
  current_player = gets.chomp.to_i
  scores = { player: 0, computer: 0 }

  # winner? loop
  loop do
    board = initialize_board

    # piece movement loop
    loop do
      display_board(board)
      prompt "#{scores}"
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    results = detect_winner(board)
    scores = increment_score(results, scores)
    winner = winner?(scores)

    if winner == :player
      prompt("You won the whole game!")
      prompt("The final score was - you: #{scores[:player]},
        Computer #{scores[:computer]}")
    elsif winner == :computer
      prompt("You won the whole game!")
      prompt("The final score was - you: #{scores[:player]},
        Computer #{scores[:computer]}")
    else
      prompt("The scores are currently - You: #{scores[:player]},
        Computer #{scores[:computer]}")
    end

    break if winner
  end

  prompt "Play again (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
