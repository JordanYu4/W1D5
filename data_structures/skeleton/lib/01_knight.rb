require_relative "00_tree_node"

class KnightPathFinder
  def initialize(start_pos)
    @start_pos = start_pos
    @move_tree = build_move_tree(start_pos)
    @grid = Array.new(8) { Array.new(8) }
    @visited_positions = [start_pos]
  end
  
  def build_move_tree(pos)
    move_tree = PolyTreeNode.new(pos)
    move_tree
  end
  
  def self.valid_pos?(pos)
    row, col = pos
    return row.between?(0, 7) && col.between?(0, 7)
  end
  
  
  def new_move_positions(pos)
    row, col = pos
    result = []
    
    result += [ [row + 1, col + 2], [row + 1, col - 2] ]
    result += [ [row + 2, col + 1], [row + 2, col - 1] ]  
    result += [ [row - 1, col + 2], [row - 1, col - 2] ]
    result += [ [row - 2, col + 1], [row - 2, col - 1] ]
    
    result.select! { |pos| KnightPathFinder.valid_pos?(pos) 
      && !visited_positions.include?(pos) }
    @visited_positions += result
    result
  end
  
  
  
  
  
  
  
  
  
  
  
  
end


if $PROGRAM_NAME == __FILE__
  knight = KnightPathFinder.new([3,3])
  p knight.possible_moves
  
end