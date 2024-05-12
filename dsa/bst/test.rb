# frozen_string_literal: true

require_relative './node'
require_relative './bst'

tree = Tree.new
tree.insert(5)
tree.insert(1)
tree.insert(3)
tree.insert(2)
tree.insert(0)
tree.insert(7)
tree.insert(8)
tree.insert(6)
tree.insert(22)
tree.insert(20)
tree.insert(25)

tree.pretty_print
# tree.delete(5)
# tree.delete(13)
# tree.delete(13)
# tree.delete(7)
# tree.delete(8)
# tree.delete(5)
tree.delete(13)
tree.delete(20)
tree.delete(5)

puts "\n\n*****\n\n"
tree.pretty_print
# p tree
# p tree
# puts tree.max
# puts tree.min