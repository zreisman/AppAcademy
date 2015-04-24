def new_range(start, end_pos)
  if start >= end_pos
    return []
  end

  new_range(start + 1, end_pos).unshift(start)
end

#p new_range(1, 10)

def sum_of_array_recurse(array)
  if array.length == 0
    return 0
  end
    array.pop + sum_of_array(array)
end

def sum_of_array_iterate(array)
  total = 0
  array.each {|num| total += num}
  total
end




p sum_of_array_iterate([2, 3, 4, 5])
