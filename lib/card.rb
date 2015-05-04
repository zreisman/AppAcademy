class Card

  SUITS = {
    :spades => 4,
    :hearts => 3,
    :clubs => 1,
    :diamonds => 2
  }

  VALUES = {
    :ace => 14,
    :two => 2,
    :three => 3,
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7,
    :eight => 8,
    :nine => 9,
    :ten => 10,
    :jack => 11,
    :queen => 12,
    :king => 13
  }



  attr_reader :suit, :value

  def initialize(suit, value)
    if !SUITS.include?(suit) || !VALUES.include?(value)
      raise "Not a valid suit or value"
    end
    @suit = suit
    @value = value
  end

  def <=>(other_card)
    if VALUES[self.value] > VALUES[other_card.value]
      return 1
    elsif VALUES[self.value] < VALUES[other_card.value]
      return -1
    else
      if SUITS[self.suit] > SUITS[other_card.suit]
        return 1
      elsif SUITS[self.suit] < SUITS[other_card.suit]
        return -1
      else
        return 0
      end
    end
  end

  def self.suits
    return SUITS.keys
  end

  def self.values
    return VALUES.keys
  end


end
