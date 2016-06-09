# rock_paper_scissors_game.rb

# VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
    :player
  elsif win?(computer, player)
    prompt("Computer Won!")
    :computer
  else
    prompt("It's a tie!")
    :tie
  end
end

def increment_score(result, scores)
  scores[result] += 1 if result != :tie
  scores
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

loop do
  prompt("Welcom to #{VALID_CHOICES.values.join(', ')}")
  prompt("First player to score 5 wins the game!")

  scores = { player: 0, computer: 0 }
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.key?(choice)
        choice = VALID_CHOICES[choice]
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample()
    Kernel.puts("Your choice: #{choice}; computer choice #{computer_choice}")

    results = display_results(choice, computer_choice)
    scores = increment_score(results, scores)
    winner = winner?(scores)

    if winner == :player_score
      prompt("You won the whole game!")
      prompt("The final score was - You: #{scores[:player]},
        Computer #{scores[:computer]}")
    elsif winner == :computer
      prompt("The computer won the whole game!")
      prompt("The final score was - You: #{scores[:player]},
        Computer #{scores[:computer]}")
    else
      prompt("The scores are currently - You: #{scores[:player]},
        Computer #{scores[:computer]}")
    end

    break if winner
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thank you for playing. Good bye!")
