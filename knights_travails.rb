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
  
  def adjacency_list
    adjList = {}
    for row in 0..7 do
      for col in 0..7 do
        board[row][col] = [row, col]
      end
    end
    for row in board do
      for col in row do
        x, y = col
        adjList[col] = []
        adjList[col] << [x - 2, y + 1] if !out_of_bounds?([x - 2, y + 1])
        adjList[col] << [x - 2, y - 1] if !out_of_bounds?([x - 2, y - 1]) 
        adjList[col] << [x + 2, y + 1] if !out_of_bounds?([x + 2, y + 1])
        adjList[col] << [x + 2, y - 1] if !out_of_bounds?([x + 2, y - 1])
        adjList[col] << [x - 1, y + 2] if !out_of_bounds?([x - 1, y + 2])
        adjList[col] << [x + 1, y + 2] if !out_of_bounds?([x + 1, y + 2])
        adjList[col] << [x - 1, y - 2] if !out_of_bounds?([x - 1, y - 2])
        adjList[col] << [x + 1, y - 2] if !out_of_bounds?([x + 1, y - 2])
      end
    end
    adjList
  end
end

class Knight
  attr_accessor :position, :up_right, :up_left, :down_right, :down_left, :left_up, :left_down, :right_up, :right_down
  def initialize(position)
    @position = position
  end
end
