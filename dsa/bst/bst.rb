# frozen_string_literal: true

require_relative '../linked_list/linked_list'

class Tree
  def initialize(array = [])
    # @root = build_tree(array.uniq.sort)
    @root = nil
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end

  def insert(data, node = @root)
    return @root = data if @root.nil?
    return data if node.nil?

    return nil if data == node

    node.left = insert(data, node.left) if data < node
    node.right = insert(data, node.right) if data > node

    node.n_children += 1
    node
  end

  def max(node = @root)
    return node if node.leaf?
    return max(node.right) unless node.right.nil?

    node
  end

  def delete(data, node = @root)
    return node if node.nil?

    node.left = delete(data, node.left) if data < node
    node.right = delete(data, node.right) if data > node

    if data == node

      return node.right if node.left.nil?
      return node.left if node.right.nil?

      node = delete_node(node)

    end

    node
  end

  def find(data, node = @root)
    return nil if node.nil?
    return node if data == node
    return find(data, node.left) if data < node

    find(data, node.right) if data > node
  end

  def level_order(node = @root)
    queue = LinkedList.new
    queue.append(node)

    array = []
    until queue.empty?
      element = queue.remove_at(0).value
      queue.append(element.left) unless element.left.nil?
      queue.append(element.right) unless element.right.nil?
      block_given? ? yield(element) : array << element.data
    end
    array unless array.empty?
  end

  def inorder(node = @root, array = [], &block)
    return if node.nil?

    inorder(node.left, array, &block)
    block_given? ? yield(node) : array << node.data
    inorder(node.right, array, &block)
    array unless array.empty?
  end

  def preorder(node = @root, array = [], &block)
    return if node.nil?

    block_given? ? yield(node) : array << node.data
    preorder(node.left, array, &block)
    preorder(node.right, array, &block)
    array unless array.empty?
  end

  def postorder(node = @root, array = [], &block)
    return if node.nil?

    postorder(node.left, array, &block)
    postorder(node.right, array, &block)
    block_given? ? yield(node) : array << node.data

    array unless array.empty?
  end

  def height(node = @root)
    return 0 if node.nil? || node.leaf?

    h_left = height(node.left)
    h_right = height(node.right)
    1 + (h_left > h_right ? h_left : h_right)
  end

  def depth(target, node = @root)
    return 0 if target == node || target.nil? || node.leaf?

    1 + (target < node ? depth(target, node.left) : depth(target, node.right))
  end

  private

  def min(node = @root)
    node = node.left until node.left.nil?
    node
  end

  def delete_node(node)
    target_node = min(node.right)
    node.data = target_node.data
    node.right = delete(target_node, node.right)
    node
  end

  def replace_node(node, side)
    target_node = side == :left ? max(node.left) : min(node.right)
    node.data = target_node.data
    side == :left ? node.left = delete(target_node, node.left) : node.right = delete(target_node, node.right)
  end

  def build_tree(array)
    nil
  end
end
