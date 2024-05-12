# frozen_string_literal: true

class Tree
  def initialize(array = [])
    # @root = build_tree(array.uniq.sort)
    @root = Node.new(13)
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end

  def insert(data, node = @root)
    return Node.new(data) if node.nil?

    node.left = insert(data, node.left) if data < node.data
    node.right = insert(data, node.right) if data > node.data

    node.n_children += 1
    node
  end

  def max(node = @root)
    return node if node.leaf?
    return max(node.right) unless node.right.nil?

    node
  end

  def min(node = @root)
    return node if node.leaf?
    return min(node.left) unless node.left.nil?

    node
  end

  def delete(data, node = @root)
    return nil if node.nil?

    return delete_node(node) if data == node.data

    node.left = delete(data, node.left) if data < node.data
    node.right = delete(data, node.right) if data > node.data

    node
  end

  private

  def delete_node(node)
    return nil if node.leaf?

    node.right.nil? ? replace_node(node, :left) : replace_node(node, :right)
    node
  end

  def replace_node(node, side)
    target_node = side == :left ? max(node.left) : min(node.right)
    node.data = target_node.data
    side == :left ? node.left = delete(target_node.data, node.left) : node.right = delete(target_node.data, node.right)
  end

  def build_tree(array)
    nil
  end
end
