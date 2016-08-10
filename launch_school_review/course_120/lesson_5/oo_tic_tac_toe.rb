require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def marked_keys(marker)
    @squares.keys.select { |key| @squares[key].marked_by_player?(marker) }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " ".freeze

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def marked_by_player?(mark)
    marker == mark
  end
end

class Player
  attr_accessor :name
  attr_reader :marker

  def initialize(marker)
    @marker = marker
    @name = set_name(marker)
  end

  def set_name(marker='X')
    if marker == 'X'
      n = ""
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter a value."
      end
      self.name = n
    elsif marker == 'O'
      self.name = ['Jim', 'Harry', 'Hagrid', 'Malfoy'].sample
    end
  end

  def choose_marker
    marker_choice =
    loop do
      puts "Please choose your marker ('X', or 'O')"
      marker_choice = gets.chomp
      break if %w(x o).include?(marker_choice.downcase)
      puts "You must choose your marker either 'X' or 'O'"
    end
    if marker_choice == 'o'
      @human.marker = COMPUTER_MARKER
      @computer.marker = HUMAN_MARKER
    end
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
    else
      @score[winner]
    end
  end

  def reset_score
    @score = { player: 0, computer: 0 }
  end

  def winner?
    if score[:player] >= POINTS_TO_WIN
      return :player
    elsif score[:computer] >= POINTS_TO_WIN
      return :computer
    else
      return false
    end
  end
end

class TTTGame
  HUMAN_MARKER = "X".freeze
  COMPUTER_MARKER = "O".freeze
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @score = Score.new
  end

  def play
    clear
    display_welcome_message

    loop do
      human.choose_marker
      display_board

      loop do

        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
        end

        @score.increment_score(display_result)
        reset
        display_score
        display_board
        break if @score.winner?
      end

      winning_message(@score.winner?)
      @score.reset_score
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def display_score
    puts "#{human.name}: #{@score.score[:player]}"
    puts "#{computer.name}: #{@score.score[:computer]}"
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
    puts "First one to #{@score.class::POINTS_TO_WIN} wins!"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def winning_message(who_won)
    if who_won == :player
      puts "#{human.name} Wins the Game!!!"
    elsif who_won == :computer
      puts "#{computer.name} Wins the Game!!!"
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_board
    puts "#{human.name} is a #{human.marker}. #{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def joinor(open_squares, delimiter = ', ', word = 'or')
    if open_squares.length - 1 > 0
      open_squares.join(delimiter).insert(-2, word + ' ')
    else
      open_squares.join('')
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_ai(line, marker)
    if board.marked_keys(marker).select { |k| line.include?(k) }.size == 2
      board.unmarked_keys.select { |k| line.include?(k) }.first
    end
  end

  def computer_moves
    square = nil

    Board::WINNING_LINES.each do |line|
      square = computer_ai(line, computer.marker)
      break if square
    end

    if !square
      Board::WINNING_LINES.each do |line|
        square = computer_ai(line, human.marker)
        break if square
      end
    end

    if !square && board.unmarked_keys.include?(5) then square = 5
    elsif !square then square = board.unmarked_keys.sample
    end
    board[square] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
      return :player
    when computer.marker
      puts "Computer won!"
      return :computer
    else
      puts "It's a tie!"
      return :tie
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
