
require 'byebug'


class Man

  SLIDE_DELTAS = [
    [1, -1],
    [1, 1],
    [-1, 1],
    [-1, -1]
  ]

  ATTACK_DELTAS = [
    [2, -2],
    [2, 2],
    [-2, -2],
    [-2, 2]
  ]

  attr_accessor :king, :pos
  attr_reader :color

  def initialize(pos, color)
    @pos = pos
    @king = false
    @color = color
  end

  def attack_moves
    moves(true)
  end

  def moves(attack = false)
    attack == false ? deltas = SLIDE_DELTAS : deltas = ATTACK_DELTAS
    all_moves = deltas.map {|delta| vector(delta)}
    on_board = all_moves.select {|m| m[0].between?(0,7) && m[1].between?(0,7) }
    return on_board if @king == true
    #byebug
    if @color == :red
      on_board.select {|m| m[0] < @pos[0]}
    else
      on_board.select {|m| m[0] > @pos[0]}
    end
  end

  def vector(delta)
    vector = @pos.map.with_index {|x, i| x + delta[i]}
    vector
  end

end
