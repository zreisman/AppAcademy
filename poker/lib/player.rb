class Player

  def self.buy_in(amt)
    Player.new(amt)

  end

  attr_reader :bankroll
  attr_accessor :hand

  def initialize(buy_in = nil)
    @bankroll = buy_in
    @fold = false

  end

  def deal_in(hand)
    @hand = hand
  end

  def take_bet(amt)
    raise "not enough money" if amt > bankroll
    @bankroll -= amt
    amt
  end

  def receive_winnings(amt)
    @bankroll += amt
  end

  def return_cards
    tmp_hand = @hand.cards
    @hand = nil
    tmp_hand
  end

  def fold
    @fold = true
  end

  def folded?
    return true if @bankroll == 0
    @fold
  end

  def unfold
    @fold = false
  end

end
