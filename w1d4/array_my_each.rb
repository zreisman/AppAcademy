class Array
  def my_each(&proc)
    (self.length).times do |i|
      proc.call self[i]
    end
    self
  end

  def my_map(&proc)
    mapped = []
    idx = 0
    self.my_each do |element|
      mapped[idx] = proc.call element
      idx+=1
    end
    mapped

  end

  def my_select(&proc)
    selected = []
    self.my_each do |i|
      if proc.call i
        selected << i
      end
    end
    selected
  end

  def my_inject(&proc)
    array = self
    aggregate = array.shift
    array.my_each do |element|
      aggregate = proc.call(aggregate, element)
    end
    aggregate
  end



  # def my_sort!(&proc)
  #
  #    sorted = false
  #    until sorted
  #      sorted = true
  #      count = 0
  #     (0...(self.length)).each do |i|
  #       if proc.call(self[i], self[i+1]) == 1
  #         self[i], self[i+1] = self[i+1], self[i]
  #         sorted = false
  #       end
  #       count += 1
  #     end
  #
  #   end
  #
  #   self
  #
  # end

  #
  #   aggregate = nil
  #   self.my_each do |element|
  #     if aggregate.nil?
  #       aggregate = self[0]
  #       next
  #     else
  #       aggregate = proc.call(aggregate,element)
  #     end
  #   end
  #   aggregate



  def my_sort!(&proc)

    sorted = false
    count = 0
    until sorted
      sorted = true
      i = 0
      while i < self.length - count
        if proc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
        i+=1
      end
      count += 1
    end
    self

  end

  def my_sort(&proc)
    array = self.dup
    array.my_sort!(&proc)
  end

#   def my_sort(&proc)
#     p array = self
#     p array.my_sort!(&proc).dup
#     p "this is our original #{self}"
#   end
#
#
end

#p [1, 2, 3, 4].my_each { |i| puts i*2 }
# p [1, 2, 3, 4].my_map { |i| i*2 }
# p [1, 2, 3, 4].my_select {|i| i%2 == 0}
#p [1, 2, 3, 4].my_inject { |sum, num| sum + num }

test = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
p test.my_sort { |num1, num2| num1 <=> num2 } #sort ascending
p test
# p [1, 3, 5].my_sort! { |num1, num2| num2 <=> num1 } #sort descending
# p [5, 3, 1].my_sort { |num1, num2| num1 <=> num2 } #sort ascending
# p [1, 3, 5].my_sort { |num1, num2| num2 <=> num1 } #sort descending
