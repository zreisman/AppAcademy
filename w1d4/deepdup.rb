def my_dup(array)
  new_array = []
  array.each do |el|
    new_array << el
  end

end



class Array
  def deep_dup
    puts 'ANOTHER CALL TO DEEP DUP'
    duped_arr = []

    self.each do |el|
      if el.is_a?(Array)
        duped_arr << el.deep_dup
      else
        duped_arr << el
      end
    end

    duped_arr
  end
end
