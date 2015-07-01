def eval_block(*arguments, &proc)
  # arguments.each do |element|
    if block_given?
      proc.call(arguments)
    else
      print "NO BLOCK GIVEN!"
    end

end

# Example calls to eval_block
eval_block("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end
# Washington, Kerry won 23 votes.
# => nil

eval_block(1,2,3,4,5) do |*args|
  p args.inject(:+)
end
# => 15
#
eval_block(1, 2, 3)
# # => "NO BLOCK GIVEN"
