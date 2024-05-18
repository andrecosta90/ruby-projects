# frozen_string_literal: true

require_relative './graph'

# The Knight class represents a knight on a chessboard and uses a graph to find the shortest path.
class Knight
  def initialize(graph)
    @graph = graph
  end

  # Finds and prints the shortest path for the knight from the source to the target.
  #
  # @param source [Array<Integer>] The starting position [x, y].
  # @param target [Array<Integer>] The target position [x, y].
  def move(source, target)
    predecessor = @graph.dijkstra(source)
    node = target

    path = []
    loop do
      path.unshift(node)
      node = predecessor[node]
      break if node.nil?
    end

    show_message(path)
  end

  private

  # Displays the path and the number of moves to the user.
  #
  # @param path [Array<Array<Integer>>] The sequence of positions [x, y] from source to target.
  def show_message(path)
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.each { |point| p point }
  end
end
