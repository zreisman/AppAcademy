
require 'card'
require 'hand'

class Deck

  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def take(n)
    raise "not enough cards" if n > @cards.count
    @cards.shift(n)
  end

  def return(cards)
    cards.each {|c| @cards << c }
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_hand
    Hand.new(@cards.shift(5))
  end

end
