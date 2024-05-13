# frozen_string_literal: true

require_relative './node_tree'
require_relative './bst'

array = (Array.new(15) { rand(1..100) })

tree = Tree.new(array)
puts "Is balanced ? #{tree.balanced?}\n"
tree.pretty_print

puts "\nIn-level: #{tree.level_order}"

puts "\nPre-order: #{tree.preorder}"

puts "\nPost-order: #{tree.postorder}"

puts "\nIn-order: #{tree.inorder}\n\n"

(Array.new(15) { rand(101..200) }).each do |el|
  tree.insert(NodeTree.new(el))
end

puts "Is balanced ? #{tree.balanced?}\n"
tree.pretty_print

tree.rebalance

puts "Is balanced ? #{tree.balanced?}\n"
tree.pretty_print

puts "\nIn-level: #{tree.level_order}"

puts "\nPre-order: #{tree.preorder}"

puts "\nPost-order: #{tree.postorder}"

puts "\nIn-order: #{tree.inorder}\n\n"

# tree.pretty_print
# p tree.balanced?
