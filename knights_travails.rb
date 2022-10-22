class GameBoard
  attr_accessor :board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def out_of_bounds?(position)
    row, col = position
    return true if row > 7 || col > 7 || row < 0 || col < 0
    false
  end
  
  def build_knight_tree(row, col)
    return if out_of_bounds?([row, col])
    root = Knight.new([row, col])
    return if board[row][col] != nil
    board[row][col] = root
    if board.all? { |arr| arr.all? } #No nil values
      board = Array.new(8) { Array.new(8) }
      return
    end
    root.up_right = build_knight_tree(row - 2, col + 1)
    root.up_left = build_knight_tree(row - 2, col - 1)
    root.down_right = build_knight_tree(row + 2, col + 1)
    root.down_left = build_knight_tree(row + 2, col - 1)
    root.left_up = build_knight_tree(row - 1, col - 2)
    root.left_down = build_knight_tree(row + 1, col - 2)
    root.right_up = build_knight_tree(row - 1, col + 2)
    root.right_down = build_knight_tree(row + 1, col + 2)
    root
  end
end

class Knight
  attr_accessor :position, :up_right, :up_left, :down_right, :down_left, :left_up, :left_down, :right_up, :right_down
  def initialize(position)
    @position = position
  end
end
