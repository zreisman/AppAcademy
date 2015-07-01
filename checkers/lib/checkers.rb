require_relative 'board'
require 'colorize'
require 'byebug'

class Checkers
  attr_reader :board

  def initialize
    @board = CheckerBoard.new
    @turn = -1
  end

  def game_over?
    # Not implemented yet
  end

  def start_game
    puts "Welcome to American Checkers!".red
    puts "Player 1, Enter your name:".yellow
    @player1 = gets.chomp
    puts "Player 2, Enter your name".green
    @player2 = gets.chomp

    until game_over?
      render_board
      @turn == -1 ? player = @player1 : player = @player2
      moves = prompt_start(player)
      if @board[moves.first].color == :red && @turn != -1
        puts "Not your turn".blue
        next
      end
      @board.perform_moves(moves)
      @turn *= -1
    end
  end

  def prompt_moves(start_pos, player)
    multi = true
    moves = [start_pos]
    while multi
      puts "#{player}, Enter you move:"
      raw = gets.chomp
      moves = raw.split('').map {|i| i.to_i }
      puts "F, Enter when finish entering:"
      gets.chomp.upcase == "F" ? multi = false : multi = true
    end
    moves
  end

  def prompt_start(player)
    puts "#{player}, Which piece would you like to move?"
    raw = gets.chomp
    start_pos = raw.split('').map {|i| i.to_i }
    prompt_moves(start_pos, player)
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
  game.start_game

end
