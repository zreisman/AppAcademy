
def as_many_biggest(amount, coins)
  number_of_biggest_coins = amount/coins.max
  remaining_amount = amount - number_of_biggest_coins * coins.max

  change = []
  number_of_biggest_coins.times do
    p change << coins.max
  end
  coins.delete(coins.max)
  make_change(remaining_amount, coins) + change

end


def use_only_one_biggest(amount, coins) #14, 25

  change = []
  coins = coins.sort.reverse

  used_coins = []
  coins.each do |coin| #10
    p "AMOUNT IS #{amount}"
    p "THE CHANGE WE HAVE RIGHT NOW: #{change}"
    p "THE COINS WE HAVE RIGHT NOW: #{coins}"
    p "THE COIN WE'RE ON: #{coin}"
    p "USED COINS #{used_coins}"
    if amount < coin #14 < 10? false
      #used_coins << coin

    else
      change << coin # change << 10cents
      amount -= coin #14 - 10 = 4. we have 4 cents left. coins = [5, 1]
      used_coins << coins

      p "WHAT DOES THIS ARRAY LOOK LIKE? #{coins-used_coins}"
      make_change(amount, coins-used_coins) + change # make_change(4, [5, 1]) + [10]
    end
  end


end


def make_change(amount, coins = [10, 7, 1])
  if amount == 0
    return []
  end
  if coins.include?(amount)
    return [amount]
  else
    #as_many_biggest(amount, coins)

    use_only_one_biggest(amount, coins)
  end
end

p make_change(14, [25, 10, 5, 1]) #[10, 1, 1, 1]



# p make_change(14, [25, 10, 5, 1]) #[10, 1, 1, 1]

#
# def make_change(amount, coins = [10, 7, 1])
#   if amount == 0
#     return []
#   end
#   if coins.include?(amount)
#     return amount
#   else
#     p "amount is #{amount}"
#     p "max coin is #{coins.max}"
#     p "coins is #{coins}"
#     number_of_biggest_coins = amount/coins.max
#     p "biggest coins: " + number_of_biggest_coins.to_s
#     remaining_amount = amount - number_of_biggest_coins * coins.max
#
#     change = []
#     number_of_biggest_coins.times do
#       p change << coins.max
#     end
#     coins.delete(coins.max)
#     make_change(remaining_amount, coins) + change
#
#   end
# end
#
# p make_change(14, [25, 10, 5, 1]) #[10, 1, 1, 1]
#
