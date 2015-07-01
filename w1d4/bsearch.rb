# def bsearch(array, target)
#   length = array.length
#
#   return
#   middle = length/2
#
#
#
#   bsearch()
#   if length.odd?
#     range =
#   if array.last > target
#     bsearch(array(0..length/2), target)
#   else
#     bsearch(array(length/2+1...length), target)
#   end
# end

def bsearch(array, target)
  return nil if array.nil?
  # return 0 if array[0] == target
  middle = array.length / 2 #middle = 1
  # middle -= 1
  # p "MIDDLE IS: #{middle}"
  #
  # p "FIRST HALF IS: #{array[0...middle]}"
  # p "SECOND HALF IS: #{array[middle+1...array.length]}"
  if array[middle] == target #array[1] == 1; 2 == 1
    return middle
  end

  if !array[middle].nil? && target < array[middle]
    bsearch(array[0...middle], target)
  else
    result = bsearch(array[middle+1...array.length], target)
    return nil if result.nil?
    result = result + middle + 1
  end
end



#
#
#
#p bsearch([1, 2, 3], 1) # => 0
# bsearch([2, 3, 4, 5], 3) # => 1
# bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 3) # => 3
# bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13], 1) # => nil#4
#
#
#
# [2, 3, 4, 5]
#
# x = 3
#
# 1 3 4 6 8 9 11   length = 7/2 = 3
#
# 4 > 6, so we're wrking with the left half
#
#
