class Player
  include Hand

  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end


end

class Dealer
  include Hand

  def initialize
    # seems like very similar to Player... do we even need this?
  end

  def deal
    # does the dealer or the deck deal?
  end
end

module Hand
  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Participant
  # What goes in here? all the redundant behaviors from Player and Dealer?
end

class Card
  def initialize
    # what are the "states" of a card?
  end
endsubl

class Deck
  SUITS = ['H', 'D', 'C', 'S'].freeze
  CARDS = ['2', '3', '4', '5', '6', '7', '8',
         '9', '10', 'J', 'Q', 'K', 'A'].freeze

  attr_reader :deck

  def initialize
    @deck = shuffle
    # obviously, we need some data structure to keep track of cards
    # array, hash, something else?
  end

  def shuffle
    SUITS.product(CARDS).shuffle
  end

  def deal
    # does the dealer or the deck deal?
  end
end

class Game
  def initialize
  @deck_of_cards = Deck.new
  @dealer = Dealer.new
  @player = Player.new
  end

  def display_welcome_message
    puts "Welcome to 21!"
  end

  def display_goodbye_message
    puts "Thank you for playing 21!"
  end

  def start
    display_welcome_message
    @deck_of_cards.deck

    # deal_cards
    # show_initial_cards
    # player_turn
    # dealer_turn
    # show_result

    display_goodbye_message
  end
end

Game.new.start





























