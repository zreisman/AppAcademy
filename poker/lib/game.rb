require 'hand'
require 'player'
require 'deck'

class Game
  attr_reader :pot, :deck, :players

def initialize
  @pot = 0
  @deck = Deck.new
  @players = []
end

def add_players(num, buy)
  num.times { @players << Player.new(buy)}
end

def game_over?
  still_in = 0
  @players.each {|player| still_in += 1 if player.bankroll > 0}
  if still_in > 1
    return false
  else
    return true
  end
end

def deal_cards
  @players.each do |player|
    if player.bankroll > 0
      player.deal_in(Hand.new(@deck.take(5)))
    end
  end
end

def add_to_pot(amt)
  @pot += amt  
end



end
