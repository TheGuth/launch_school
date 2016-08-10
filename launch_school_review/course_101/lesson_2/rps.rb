# rps.rb
require 'pry'

VALID_CHOICES = { 'rock' => %w(lizard scissors),
                  'paper' => %w(rock sock),
                  'scissors' => %w(paper lizard),
                  'lizard' => %w(spock paper),
                  'spock' => %w(scissors rock) }

CHOICE_CONVERSION = { 'r' => 'rock',
                      'p' => 'paper',
                      's' => 'scissors',
                      'l' => 'lizard',
                      'sp' => 'spock' }

SCORES = { player: 0, computer: 0 }
SCORE_TO_WIN = 5

def choice_conversion(choice)
  if CHOICE_CONVERSION.include?(choice)
    CHOICE_CONVERSION[choice]
  else
    choice
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

def win?(first, second)
  VALID_CHOICES[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
    :player
  elsif win?(computer, player)
    prompt("Computer won!")
    :computer
  else
    prompt("It's a tie!")
    :tie
  end
end

def winner?(player)
  if player == :tie
    return SCORES
  else
    SCORES[player] += 1
  end
end

def display_current_score
  prompt("#{SCORES}")
end

def someone_won?(player, computer)
  if player >= 5
    prompt("You won the game!")
    true
  elsif computer >= 5
    prompt("Computer won the game!")
    true
  else
    false
  end
end

prompt("Welcome to Rock Paper Scissors Lizard Spock Game")

loop do
  choice = nil
  loop do
    loop do
      prompt("Choose one: (r)rock, (p)paper, (s)scissors, (l)lizard, or (sp)spock.")
      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(choice) || CHOICE_CONVERSION.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_chioce = VALID_CHOICES.keys.sample.downcase

    Kernel.puts("You chose: #{choice}")
    Kernel.puts("Computer chose: #{computer_chioce}")

    round_winner = display_results(choice_conversion(choice), computer_chioce)
    winner?(round_winner)
    display_current_score
    break if someone_won?(SCORES[:player], SCORES[:computer])
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
