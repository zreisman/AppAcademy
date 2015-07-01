require 'card'

class Hand
  attr_accessor :cards

  def initialize(cards)
    raise "must have five cards" if cards.count < 5
    @cards = cards
  end

  def trade_cards(take_cards, new_cards)
    raise "must have five cards" unless take_cards.count == new_cards.count
    if @cards.select {|c| take_cards.include?(c)}.count != take_cards.count
      raise "cannot discard unowned card"
    end
    cards = @cards.select {|c| !take_cards.include?(c)}
    @cards = cards
    @cards.concat(new_cards)
  end

end
