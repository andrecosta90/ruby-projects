# frozen_string_literal: true

# The KnightGraphBuilder class builds the graph structure for knight moves on a chessboard.
class KnightGraphBuilder
  INDEXES = (0..7).to_a.freeze
  OFFSET_VALUES = [-2, -1, 1, 2].freeze

  def build
    nodes = INDEXES.product(INDEXES).freeze
    edges = build_edges(nodes)
    { nodes: nodes, edges: edges }
  end

  private

  def build_edges(nodes)
    edges = {}
    nodes.each do |node_u|
      edges[node_u] = neighbors(node_u)
    end
    edges.freeze
  end

  def neighbors(source)
    neighbors = []
    knight_move_offsets.each do |coef|
      coord_x = source[0] + coef[0]
      coord_y = source[1] + coef[1]

      next if coord_x.negative? || coord_y.negative?
      next if coord_x > 7 || coord_y > 7

      neighbors << [coord_x, coord_y]
    end
    neighbors
  end

  def knight_move_offsets
    OFFSET_VALUES.product(OFFSET_VALUES).reject { |el| el[0].abs == el[1].abs }
  end
end
