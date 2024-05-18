# frozen_string_literal: true

# gem install algorithms
require 'algorithms'

# The Graph class implements Dijkstra's algorithm to find the shortest path in a graph.
class Graph
  attr_reader :struct

  def initialize(struct)
    @struct = struct
    @distance = {}
    @predecessor = {}
    @visited = {}
  end

  # Implements Dijkstra's algorithm to find the shortest path from the source node to all other nodes.
  #
  # @param source [Object] The source node from which to calculate the shortest paths.
  # @return [Hash] A hash mapping each node to its predecessor on the shortest path from the source.
  def dijkstra(source)
    initialize_single_source(source)

    # Priority queue to select the node with the smallest distance.
    pqueue = Containers::PriorityQueue.new

    pqueue.push(source, 0)

    until pqueue.empty?
      node_u = pqueue.pop
      break if node_u.nil?

      struct.neighbors(node_u) do |node_v|
        relax(node_u, node_v, pqueue)
      end
    end
    @predecessor.dup
  end

  private

  # Initializes the distance and predecessor for each node.
  #
  # @param source [Object] The source node from which to initialize distances.
  def initialize_single_source(source)
    struct.nodes.each do |node|
      @distance[node] = Float::INFINITY
      @predecessor[node] = nil
      @visited[node] = false
    end
    @distance[source] = 0
  end

  # Relaxes the edge between node_u and node_v and updates the priority queue.
  #
  # @param node_u [Object] The current node being processed.
  # @param node_v [Object] The neighboring node being checked.
  # @param pqueue [Containers::PriorityQueue] The priority queue used to select the next node.
  def relax(node_u, node_v, pqueue)
    new_dist = @distance[node_u] + 1

    return unless @distance[node_v] > new_dist

    pqueue.push(node_v, new_dist)

    @distance[node_v] = new_dist
    @predecessor[node_v] = node_u
    @visited[node_v] = true
  end
end
