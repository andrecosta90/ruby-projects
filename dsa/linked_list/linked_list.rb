# frozen_string_literal: true

require './node'

# Represents a singly linked list data structure.
class LinkedList
  attr_reader :size, :head, :tail

  def initialize
    @size = 0
    @head = @tail = nil
  end

  def append(value)
    node = create_node(value)
    if head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(value)
    node = create_node(value, @head)
    @tail = node if head.nil?
    @head = node
  end

  def at(index)
    index = index.negative? ? size + index : index
    return nil if index.negative? || head.nil?

    pointer = head
    index.times { pointer = pointer.next_node }
    pointer
  end

  def remove_at(index)
    current_node = at(index)
    previous_node = (size + index).positive? ? at(index - 1) : nil
    return nil if current_node.nil?

    if @head == current_node
      @head = @head.next_node
    else
      previous_node.next_node = current_node.next_node

    end
    @size -= 1
    @tail = previous_node if @tail == current_node
    current_node.next_node = nil
    current_node
  end

  def pop
    remove_at(-1)
  end

  def to_s
    format = []

    pointer = @head
    until pointer.nil?
      format << "( #{pointer.value} )"
      pointer = pointer.next_node
    end
    format << 'nil'
    format.join(' -> ')
  end

  private

  def create_node(value, next_node = nil)
    @size += 1
    Node.new(value, next_node)
  end
end
