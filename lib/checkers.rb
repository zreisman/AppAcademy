require_relative 'board'
require 'colorize'
require 'byebug'

class Checkers
  attr_reader :board

  def initialize
    @board = CheckerBoard.new
  end

  def render_board
    (0..7).each do |row|
      print "#{row}: ".yellow
      (0..7).each do |col|
        print render_tile([row, col])
      end
      puts
    end
    puts "    0  1  2  3  4  5  6  7 ".yellow
  end

  def render_tile(pos)
    y, x = pos
    color = @board.grid[y][x].color unless @board.grid[y][x].nil?
    if y.even? && x.even? || y.odd? && x.odd?
      if @board.grid[y][x] == nil
        return "   ".colorize(:background => :light_red)
      else
        return " ● ".colorize(:background => :light_red, :color => color)
      end
    else
      if @board.grid[y][x] == nil
        return "   ".colorize(:background => :black)
      else
        return " ● ".colorize(:background => :black, :color => color)
      end
    end
  end
end


if __FILE__ == $PROGRAM_NAME

  game = Checkers.new
  game.board.set_board
  game.render_board

end
