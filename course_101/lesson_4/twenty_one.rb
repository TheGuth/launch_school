# twenty-one.rb

require 'pry'

WINS_NEEDED = 5
HIGHEST_SCORE = 31
DEALER_STAY = 27

def clear_screen
  system('clear') || system('cls')
end

def prompt(msg)
  puts("=> #{msg}")
end

def initialized_deck
  [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'],
   ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'], ['H', 'Q'], ['H', 'K'],
   ['H', 'A'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'],
   ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'],
   ['D', 'K'], ['D', 'A'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'],
   ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'],
   ['C', 'Q'], ['C', 'K'], ['C', 'A'], ['S', '2'], ['S', '3'], ['S', '4'],
   ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'],
   ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A']]
end

def deal_initial_cards_to_player(cards)
  players_hand = []
  card_1 = cards.sample
  card_2 = cards.sample
  players_hand << card_1
  players_hand << card_2
end

def deal_initial_cards_to_dealer(cards)
  dealers_hand = []
  card_1 = cards.sample
  card_2 = cards.sample
  dealers_hand << card_1
  dealers_hand << card_2
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

def face_card_value(players_hand)
  players_hand.each do |card|
    if card[1] == "J" || card[1] == "Q" || card[1] == "K"
      card[1] = '10'
    end
  end
end

def ace_value(players_hand) # ace_value([['S', 'A'], ['H', '5']])
  players_hand.each do |card|
    next unless card[1] == 'A'
    card[1] = '11' if players_total(players_hand) < (HIGHEST_SCORE - 11)
    if players_total(players_hand) > (HIGHEST_SCORE - 11)
      card[1] = '1'
    end
  end
end

def display
  puts "_____________________________________________________"
  puts "### #{HIGHEST_SCORE} GAME ###".center(50)
  puts "_____________________________________________________"
  puts "Players | Rounds | SCORE   | CARDS "
  puts "_____________________________________________________"
end

def display_cards(players_hand, dealers_hand, scores)
  display
  player_display = "Player |    #{scores[:player]}    |\
     #{players_total(players_hand)}    | "
  dealers_display = "Dealer |    #{scores[:dealer]}    |\
     #{dealers_total(dealers_hand)}    |\
      |#{dealers_hand[0][1]}| and unknown card"
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

def score_compare(players_total, dealers_total,
                  previous_players_total, previous_dealers_total)
  if players_total > dealers_total
    prompt("Player Won!")
    prompt("Score was player: #{previous_players_total}")
    prompt("          dealer: #{previous_dealers_total}")
    :player
  elsif players_total < dealers_total
    prompt("Dealer Won!")
    prompt("Score was player: #{previous_players_total}")
    prompt("          dealer: #{previous_dealers_total}")
    :dealer
  elsif players_total == dealers_total
    prompt("Score was a tie")
    prompt("Score was player: #{previous_players_total}")
    prompt("          dealer: #{previous_dealers_total}")
    :tie
  end
end

def player_turn(cards, players_hand, dealers_hand, scores)
  loop do
    system 'clear'
    ace_value(players_hand)
    face_card_value(players_hand)
    display_cards(players_hand, dealers_hand, scores)
    p_total = players_total(players_hand)

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

def dealer_turn(cards, dealers_hand)
  new_card = []
  loop do
    ace_value(dealers_hand)
    face_card_value(dealers_hand)
    d_total = dealers_total(dealers_hand)

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

def increment_score(result, scores)
  scores[result] += 1 if result
end

loop do
  clear_screen
  prompt("Welcome to the game of twenty one!!")
  prompt("First player to 21 wins!")
  puts ""

  scores = { player: 0, dealer: 0, tie: 0 }
  loop do
    cards = initialized_deck

    players_hand = deal_initial_cards_to_player(cards)
    dealers_hand = deal_initial_cards_to_dealer(cards)
    player_turn(cards, players_hand, dealers_hand, scores)
    dealer_turn(cards, dealers_hand)
    results = who_wins(players_total(players_hand), dealers_total(dealers_hand))

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
