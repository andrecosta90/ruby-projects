# frozen_string_literal: true

require_relative './graph'

# The Knight class represents a knight on a chessboard and uses a graph to find the shortest path.
class Knight
  INDEXES = (0..7).to_a.freeze
  NODES = INDEXES.product(INDEXES).freeze
  OFFSET_VALUES = [-2, -1, 1, 2].freeze

  def initialize
    @graph = Graph.new(self)
  end

  def nodes
    NODES
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

  # Yields the neighboring positions that a knight can move to from the source position.
  #
  # @param source [Array<Integer>] The current position [x, y].
  def neighbors(source)
    knight_move_offsets.each do |coef|
      coord_x = source[0] + coef[0]
      coord_y = source[1] + coef[1]

      next if coord_x.negative? || coord_y.negative?
      next if coord_x > 7 || coord_y > 7

      yield([coord_x, coord_y])
    end
  end

  private

  # Returns the possible move offsets for a knight.
  #
  # @return [Array<Array<Integer>>] An array of [dx, dy] offsets
  def knight_move_offsets
    OFFSET_VALUES.product(OFFSET_VALUES).reject { |el| el[0].abs == el[1].abs }
  end

  # Displays the path and the number of moves to the user.
  #
  # @param path [Array<Array<Integer>>] The sequence of positions [x, y] from source to target.
  def show_message(path)
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.each { |point| p point }
  end
end
