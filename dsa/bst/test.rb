# frozen_string_literal: true

require_relative './node_tree'
require_relative './bst'

tree = Tree.new
tree.insert(NodeTree.new(5))
tree.insert(NodeTree.new(1))
tree.insert(NodeTree.new(3))
tree.insert(NodeTree.new(2))
tree.insert(NodeTree.new(0))
tree.insert(NodeTree.new(7))
tree.insert(NodeTree.new(8))
tree.insert(NodeTree.new(6))
tree.insert(NodeTree.new(22))
tree.insert(NodeTree.new(20))
tree.insert(NodeTree.new(25))

tree.pretty_print
# tree.delete(NodeTree.new 5)
# tree.delete(NodeTree.new 13)
# tree.delete(NodeTree.new 13)
# tree.delete(NodeTree.new 7)
# tree.delete(NodeTree.new 8)
# tree.delete(NodeTree.new 5)
tree.delete(NodeTree.new(13))
tree.delete(NodeTree.new(1))
# tree.delete(NodeTree.new(20))
# tree.delete(NodeTree.new(5))
# tree.insert(NodeTree.new(4))
# tree.insert(NodeTree.new(5))
# tree.insert(NodeTree.new(3.9))

puts "\n\n*****\n\n"
tree.pretty_print

p tree.find(NodeTree.new(4))
p tree.find(NodeTree.new(3.900001))

# puts "\n\n*****\n\n"

# p tree.inorder #{ |el| puts el }
p tree.inorder
puts "\n\n*****\n\n"
tree.inorder { |el| puts el }
# tree.level_order { |el| puts el }
puts "\n\n*****\n\n"
# p tree
# p tree
# puts tree.max
# puts tree.min
p tree.height
p tree.height(tree.find(NodeTree.new(25)))
p tree.depth(tree.find(NodeTree.new(6)))
