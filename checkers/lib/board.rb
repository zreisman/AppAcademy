require_relative 'piece'
require_relative 'errors'
require 'byebug'

class CheckerBoard
  attr_reader :grid, :jail

  BOARD_SIZE = 8

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @jail = []
  end

  def [](pos)
    y, x = pos
    @grid[y][x]
  end

  def []=(pos, value)
    y, x = pos
    @grid[y][x] = value
  end

  def attack!(start_pos, end_pos)
      target_pos = find_between(start_pos, end_pos)
      imprison(target_pos)
      move!(start_pos, end_pos)
      true
  end

  def dup
    duped_board = CheckerBoard.new
    (0..7).each do |row|
      (0..7).each do |col|
        next if @grid[row][col].nil?
        king = @grid[row][col].king
        duped_board[[row,col]] = Man.new([row,col], @grid[row][col].color, king)
      end
    end
    duped_board
  end

  def find_between(start_pos, end_pos)
    [((start_pos[0] + end_pos[0]) / 2), ((start_pos[1] + end_pos[1]) / 2)]
  end

  def imprison(target_pos)
    @jail << self[target_pos]
    self[target_pos] = nil
  end

  def move(start_pos, end_pos)   # ADD CHECK FOR NOT YOUR MOVE
    if valid_attack?(start_pos, end_pos)
      attack!(start_pos, end_pos)
    elsif valid_move?(start_pos, end_pos)
      move!(start_pos, end_pos)
    else
      raise InvalidMove.new
    end
  end

  def move!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos].pos = end_pos
    self[start_pos] = nil
    false
  end

  def on_board?(pos)
    return true if pos[0].between?(0,7) && pos[0].between?(0,7)
    false
  end


  def perform_moves(move_sequence)
    slide = true
    until move_sequence.count < 2 || slide == false
      current = move_sequence.shift
      slide = move(current, move_sequence.first)
    end
  end

  def set_board
    (0...BOARD_SIZE).each do |row|
      next if row.between?(3,4)
      row.between?(0,2) ? color = :white : color = :red
      (0...BOARD_SIZE).each do |col|
        if row.even? && col.odd?
          @grid[row][col] = Man.new([row, col], color)
        elsif col.even? && row.odd?
          @grid[row][col] = Man.new([row, col], color)
        end
      end
    end
  end

  def valid_attack?(start_pos, end_pos) #Square in pieces attack moves
    return false unless self[start_pos].attack_moves.include?(end_pos)
    target_pos = find_between(start_pos, end_pos)
    return false if self[target_pos].nil?
    self[target_pos].color != self[start_pos].color
  end

  def valid_move?(start_pos, end_pos) #
    return false unless self[start_pos].moves.include?(end_pos)
    return false if self[start_pos].nil?
    on_board?(start_pos)
  end

  def validate_moves(move_sequence)
    duped = self.dup

    until move_sequence.count < 2
      current = move_sequence.shift
      duped.move(current, move_sequence.first)
    end

  end
end

if __FILE__ == $PROGRAM_NAME

  board = CheckerBoard.new
  board.set_board
  board.perform_moves([[5,2],[4,3],[3,4]])
end
