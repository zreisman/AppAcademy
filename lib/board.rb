require_relative 'piece'
require 'byebug'

class CheckerBoard
  attr_reader :grid

  BOARD_SIZE = 8

  def initialize
    @grid = Array.new(8) { Array.new(8) }

  end

  def [](pos)
    y, x = pos
    @grid[y][x]
  end

  def []=(pos, value)
    y, x = pos
    @grid[y][x] = value
  end

  def move!(start_pos, end_pos)
    return false if self[start_pos].nil? || self[end_pos].nil?
    self[end_pos] = self[start_pos]
    self[start_pos].pos = end_pos
    self[start_pos] = nil
    true
  end

  def on_board?(pos)
    return true if pos[0].between(0,7) && pos[0].between(0,7)
    false
  end

  def set_board
    (0...BOARD_SIZE).each do |row|
      next if (2..5).to_a.include?(row)
      row.between?(0,1) ? color = :white : color = :red
      (0...BOARD_SIZE).each do |col|
        if row.even? && col.odd?
          @grid[row][col] = Man.new([row, col], color)
        elsif col.even? && row.odd?
          @grid[row][col] = Man.new([row, col], color)
        end
      end
    end
  end
end


if __FILE__ == $PROGRAM_NAME

  board = CheckerBoard.new
  board.set_board
end
