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

  def bfs(graph, source)
    info = {}
    graph.keys.each do |key|
      info[key] = { distance: nil, predecessor: nil }
    end
    info[source][:distance] = 0

    queue = Queue.new
    queue << source
    while !queue.empty?
      current = queue.pop
      graph[current].each do |neighbour|
        if info[neighbour][:distance] == nil
          info[neighbour][:distance] = info[current][:distance] + 1
          info[neighbour][:predecessor] = current
          queue << neighbour
        end
      end
    end
    info
  end

  def knight_moves(start, endpoint)
    return if out_of_bounds?(start) || out_of_bounds?(endpoint)
    graph = adjacency_list
    bfs_info = bfs(graph, start)
    predecessors = []
    predecessors << endpoint
    bfs_info[endpoint][:distance].times do
      last_index = predecessors[-1]
      predecessors <<  bfs_info[last_index][:predecessor]
    end
    p predecessors.reverse
  end
end
