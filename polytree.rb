require 'byebug'

class PolyTreeNode

  attr_accessor :children
  attr_reader :parent, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent)
    if parent != nil
      if parent != @parent && @parent != nil
        @parent.children.delete(self)

      end
      @parent = parent
      @parent.children << self if !@parent.children.include?(self)
    else
      @parent.children.delete(self)
    end
    @parent = parent
  end

  def add_child(child)
    self.children << child if !@children.include?(child)
    child.parent = self
  end

  def remove_child(child)
    self.children.delete(child)
    child.parent = nil
  end

  def trace_back_path
    return [] if parent == nil

    self.parent.trace_back_path << self.value

  end

  def dfs(target_value)
    ret_arr = []
    if self.value == target_value
      return self
    end

    self.children.each do |child|
      value2 = child.dfs(target_value)
      unless value2.nil?
        return value2
      end

    end

    nil
  end

  def bfs(target_value)
    queue = []
    queue.push(self)
    while queue.length > 0
      node = queue.shift
      return node if node.value == target_value
      node.children.each {|child| queue.push(child) }
    end

    nil
  end
end



class KnightPathFinder

  KNIGHTS_MOVES = [[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1]]

  attr_reader :valid_moves

  def self.valid_moves(pos)
    x, y = pos
    valid_moves = []
    KNIGHTS_MOVES.each do |move|
      x_cand = x + move.first
      y_cand = y + move.last
      valid_moves << [x_cand, y_cand] if (x_cand >= 0 && x_cand < 8 && y_cand >= 0 && y_cand < 8)
    end
    valid_moves
  end

  def initialize(pos)
    @start = PolyTreeNode.new(pos)
    build_move_tree
  end

  def find_path(destination)
    @start.dfs(destination)
  end

  def build_move_tree
    queue = [@start]
    checked_moves = []
    until queue.empty?
      first_item = queue.shift
      self.class.valid_moves(first_item.value).each do |valid_move|
        unless checked_moves.include?(valid_move)
          node = PolyTreeNode.new(valid_move)
          node.parent = first_item
          queue.push(node)
          checked_moves << valid_move
        end
      end
    end

  end

  # def valid_move?(x, y)
  #   x >= 0 && x < 8 && y >= 0 && y < 8
  # end
end


kpf = KnightPathFinder.new([0,0])

p kpf.find_path([7,7]).trace_back_path


# n1 = PolyTreeNode.new("node1")
# n2 = PolyTreeNode.new("node2")
#
# p n2.parent = n1
# p n2.parent = nil
