require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # digonals

FIRST_SQUARE = 5
WINS_NEEDED = 5
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
    brd.select do |k_board_spot, value_marker|
      line.include?(k_board_spot) &&
        value_marker == INITIAL_MARKER
    end.keys.first
  end
end

def square_offense_defense(brd, marker)
  square = nil
  if !square
    WINNING_LINES.each do |line|
      square = square_at_risk(line, brd, marker)
      break if square
    end
  end
  square
end

def computer_places_piece!(brd)
  if square_offense_defense(brd, COMPUTER_MARKER)
    square = square_offense_defense(brd, COMPUTER_MARKER)
    square 
  elsif square_offense_defense(brd, PLAYER_MARKER)
    square = square_offense_defense(brd, PLAYER_MARKER)
  elsif brd[FIRST_SQUARE] == INITIAL_MARKER
    square = FIRST_SQUARE
  else
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
  scores[result] += 1 if result
end

def winner(scores)
  if scores[:player] >= WINS_NEEDED
    :player
  elsif scores[:computer] >= WINS_NEEDED
    :computer
  end
end

def place_piece!(board, current_player)
  if current_player == :player
    player_places_piece!(board)
  elsif current_player == :computer
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == :player ? :computer : :player
end

# Main game loop
loop do
  prompt "Welcome to Tic Tac Toe"
  prompt "First player to score 5 wins the game!"
  puts ""
  prompt "Enter who you would like to go first"
  prompt "player or computer"
  current_player = gets.chomp
  if current_player.downcase.start_with?('p')
    current_player = :player
  elsif current_player.downcase.start_with?('c')
    current_player = :computer
  else
    prompt "That wasn't one of the choices so we will let you go first."
    current_player = :player
  end

  scores = { player: 0, computer: 0 }

  # winner? loop
  loop do
    board = initialize_board

    # piece movement loop
    loop do
      display_board(board)
      prompt(scores.to_s)
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
    scores[results] = increment_score(results, scores)
    winner = winner(scores)

    prompt("Player Score: #{scores[:player]}
      | Computer Score: #{scores[:computer]}")
    prompt("hit Enter when ready for next game.")
    gets.chomp

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

  prompt "Play again? Please Enter: (yes or no)"
  answer = gets.chomp
  loop do
    if not answer.downcase.start_with?('n') || answer.downcase.start_with?('y')
      prompt("sorry, you didn't choose yes or no")
      prompt("Do you want to play again? please Enter: (yes or no)")
      answer = gets.chomp
      if answer.downcase.start_with?('n') || answer.downcase.start_with?('y')
        break
      end
    end
  end

  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
