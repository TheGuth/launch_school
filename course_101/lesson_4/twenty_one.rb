# twenty-one.rb

require 'pry'

WINS_NEEDED = 5
HIGHEST_SCORE = 31
DEALER_STAY = 27
SUITS = ['H', 'D', 'C', 'S'].freeze
CARDS = ['2', '3', '4', '5', '6', '7', '8',
         '9', '10', 'J', 'Q', 'K', 'A'].freeze

def clear_screen
  system('clear') || system('cls')
end

def prompt(msg)
  puts("=> #{msg}")
end

def initialized_deck
  SUITS.product(CARDS).shuffle
end

def deal_initial_cards(cards)
  cards.sample(2)
end

def players_total(players_hand)
  players_hand_total = 0
  players_hand.each do |card|
    players_hand_total = card[1].to_i + players_hand_total
  end
  players_hand_total
end

def dealers_total(dealers_hand)
  dealers_hand_total = 0
  dealers_hand.each do |card|
    dealers_hand_total = card[1].to_i + dealers_hand_total
  end
  dealers_hand_total
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A" || value == "11"
      if sum <= (HIGHEST_SCORE - 11)
        sum += 11
      else
        sum += 1
      end
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  sum
end

def display_scoreboard_header
  puts "_____________________________________________________"
  puts "### #{HIGHEST_SCORE} GAME ###".center(50)
  puts "_____________________________________________________"
  puts "Players | Rounds | SCORE   | CARDS "
  puts "_____________________________________________________"
end

def hide_dealers_cards(dealers_hand, hide = true)
  dealers_cards = ''
  if hide == true
    dealers_cards = "??| "
  elsif hide == false
    dealers_hand.each do |card|
      cards_to_display = "|" + card[1] + "| "
      dealers_cards += cards_to_display
    end
  end
  dealers_cards
end

def display_cards(players_hand, dealers_hand, scores, hide = true)
  display_scoreboard_header
  player_display = "Player |    #{scores[:player]}    |\
     #{total(players_hand)}    | "
  dealers_display = "Dealer |    #{scores[:dealer]}    |\
     #{total(dealers_hand)}    |\
      |#{hide_dealers_cards(dealers_hand, hide)}"
  players_hand.each do |card|
    cards_to_display = "|" + card[1] + "| "
    player_display += cards_to_display
  end
  puts player_display
  puts dealers_display
end

def who_wins(players_total, dealers_total)
  previous_players_total = players_total
  previous_dealers_total = dealers_total
  if players_total > HIGHEST_SCORE
    players_total = 0
    prompt("Dealer Won!")
    prompt("Score was player: #{previous_players_total} to \n
      dealer #{previous_dealers_total}")
    return
  end

  if dealers_total > HIGHEST_SCORE
    dealers_total = 0
  end

  score_compare(players_total, dealers_total,
                previous_players_total, previous_dealers_total)
end

def score_display(previous_p_total, previous_d_total)
  prompt("Score was player: #{previous_p_total}")
  prompt("          dealer: #{previous_d_total}")
end

def score_compare(p_total, d_total,
                  previous_p_total, previous_d_total)
  if p_total > d_total
    prompt("Player Won!")
    score_display(previous_p_total, previous_d_total)
    :player
  elsif p_total < d_total
    prompt("Dealer Won!")
    score_display(previous_p_total, previous_d_total)
    :dealer
  elsif p_total == d_total
    prompt("Score was a tie")
    score_display(previous_p_total, previous_d_total)
    :tie
  end
end

def player_turn(cards, players_hand, dealers_hand, scores)
  loop do
    system 'clear'
    display_cards(players_hand, dealers_hand, scores)
    p_total = total(players_hand)

    if p_total <= HIGHEST_SCORE
      prompt("Would you like to 'hit' or 'stay'? Please select one.")
      decision = gets.chomp.to_s
      if decision.downcase.start_with?('h')
        players_hand << cards.sample
      elsif decision.downcase.start_with?('s')
        break
      else
        prompt("player needs to choose to 'hit' or 'stay'.")
      end
    else
      prompt("You have busted!!")
      break
    end
  end
end

def dealer_turn(cards, players_hand, dealers_hand, scores)
  new_card = []
  hide = false
  loop do
    system 'clear'
    display_cards(players_hand, dealers_hand, scores, hide)
    sleep(2)
    d_total = total(dealers_hand)

    if d_total < DEALER_STAY
      new_card = cards.sample
      dealers_hand << new_card
    elsif d_total > HIGHEST_SCORE
      prompt("Dealer Busts!")
      break
    else
      break
    end
  end
end

def winner(scores)
  if scores[:player] >= WINS_NEEDED
    :player
  elsif scores[:dealer] >= WINS_NEEDED
    :dealer
  end
end

def increment_score(winning_player, scores)
  scores[winning_player] += 1 if winning_player
end

loop do
  clear_screen
  prompt("Welcome to the game of twenty one!!")
  prompt("First player to #{HIGHEST_SCORE} wins!")
  puts ""

  scores = { player: 0, dealer: 0, tie: 0 }
  loop do
    cards = initialized_deck

    players_hand = deal_initial_cards(cards)
    dealers_hand = deal_initial_cards(cards)
    player_turn(cards, players_hand, dealers_hand, scores)
    dealer_turn(cards, players_hand, dealers_hand, scores)
    results = who_wins(total(players_hand), total(dealers_hand))

    scores[results] = increment_score(results, scores)
    winner = winner(scores)

    prompt("Player Score: #{scores[:player]}
      | Computer Score: #{scores[:dealer]}")
    prompt("hit Enter when ready for next game.")
    gets.chomp

    if winner == :player
      prompt("You won the whole game!")
      prompt("The final score was - you: #{scores[:player]},
        Computer #{scores[:dealer]}")
    elsif winner == :dealer
      prompt("You won the whole game!")
      prompt("The final score was - you: #{scores[:player]},
        Computer #{scores[:dealer]}")
    else
      prompt("The scores are currently - You: #{scores[:player]},
        Computer #{scores[:dealer]}")
    end

    break if winner
  end

  prompt "Play again? Please Enter: (yes or no)"
  answer = gets.chomp
  loop do
    if answer.downcase.start_with?('n', 'y')
      break
    else
      prompt("sorry, you didn't choose yes or no")
      prompt("Do you want to play again? please Enter: (yes or no)")
      answer = gets.chomp
    end
  end

  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Twenty One! Good Bye!"
