# frozen_string_literal: true

require_relative './node_tree'
require_relative './bst'

array = [3, 1, 5, 10, 15, 20]
tree = Tree.new(array)

tree.pretty_print
tree.delete(NodeTree.new(10))
tree.pretty_print