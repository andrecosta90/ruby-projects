# frozen_string_literal: true

# require 'priority_queue'

INDEXES = (0..7).to_a.freeze
NODES = INDEXES.product(INDEXES).freeze
OFFSET_VALUES = [-2, -1, 1, 2].freeze

VISITED = {}
DIST = {}
PRED = {}
SUCC = {}
def coefs
  OFFSET_VALUES.product(OFFSET_VALUES).reject { |el| el[0].abs == el[1].abs }
end

def neighbors(source)
  coefs.each do |coef|
    coord_x = source[0] + coef[0]
    coord_y = source[1] + coef[1]

    next if coord_x.negative? || coord_y.negative?
    next if coord_x > 7 || coord_y > 7

    yield([coord_x, coord_y])
  end
end

def valid?(predecessor, successor)
  neighbors(predecessor) do |neigh|
    return true if neigh == successor
  end
  false
end

def knight_moves(source, target)
  neighbors(source) do |neigh|
    p neigh
  end

  target = nil
end

def initialize_single_source(source)
  NODES.each do |node|
    DIST[node] = Float::INFINITY
    PRED[node] = nil
    SUCC[node] = nil
    VISITED[node] = false
  end
  DIST[source] = 0
end

def relax(node_u, node_v)
  new_dist = DIST[node_u] + 1

  return unless DIST[node_v] > new_dist

  DIST[node_v] = new_dist
  PRED[node_v] = node_u
  SUCC[node_u] = node_v
  VISITED[node_v] = true
end

def dijkstra(source, target)
  initialize_single_source(source)
  visited = []

  while visited.length < NODES.length
    node_u = DIST.reject { |node| visited.include?(node) }.min_by(&:last).first
    visited.push(node_u)
    neighbors(node_u) do |node_v|
      relax(node_u, node_v)
    end
  end
end
# knight_moves([0, 0], [1, 2]) == [[0, 0], [1, 2]]
# neighbors([0, 0]) { |e| p e }
# knight_moves([0, 0], [1, 2])
# p NODES
source = [0, 0]
target = [2,2]

dijkstra(source, target)

path = []

curr = target
loop do
  path.unshift(curr)
  curr = PRED[curr]

  break if curr.nil?
end

# puts '**'

p path

# p SUCC

# # puts "***"

# neighbors([1, 2]) { |el| p el}
# puts
# neighbors([2, 1]) { |el| p el}