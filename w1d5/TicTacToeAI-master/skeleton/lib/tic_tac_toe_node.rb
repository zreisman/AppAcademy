require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if @board.winner != evaluator
    false
  end

  def winning_node?(evaluator)
    return true if @board.winner == evalulator
    false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    (0..2).each do |x|
      (0..2).each do |y|
        if @board[x][y].empty?
          @new_board = @board.dup
          @new_board[x][y] = @next_mover_mark
          @next_mover_mark == :x ? @childs_move = :o ; @childs_move = :x
          TicTacToeNode.new(@new_board, @childs_move, @next_mover_mark)
        end
      end
    end
  end
end
