class GameBoard
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def out_of_bounds?(position)
    row, col = position
    return true if row > 7 || col > 7 || row < 0 || col < 0
    return false
  end
  
end

class Knight
  attr_accessor :up_right, :up_left, :down_right, :down_left, :left_up, :left_down, :right_up, :right_down
  def initialize(position)
    @position = position
  end
end