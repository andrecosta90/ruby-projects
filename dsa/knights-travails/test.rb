# frozen_string_literal: true

require_relative './graph'
require_relative './knight'
require_relative './knight_graph_builder'

# Build the knight's graph structure
builder = KnightGraphBuilder.new
graph_data = builder.build
graph = Graph.new(graph_data[:nodes], graph_data[:edges])

kn = Knight.new(graph)

source = [0, 1]
target = [7, 6]
kn.move(source, target)
