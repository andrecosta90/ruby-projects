# frozen_string_literal: true

require_relative './node'

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
    index = normalize_index(index)

    return nil if index > size || head.nil?
    return tail if index == @size - 1

    pointer = head
    index.times { pointer = pointer.next_node }
    pointer
  end

  def remove_at(index)
    current_node = at(index)
    previous_node = (size + index).positive? ? at(index - 1) : nil
    return nil if current_node.nil?

    if @head == current_node then @head = @head.next_node
    else
      previous_node.next_node = current_node.next_node end
    @size -= 1
    @tail = previous_node if @tail == current_node
    current_node.next_node = nil
    current_node
  end

  def insert_at(value, index)
    index = normalize_index(index)

    raise IndexError, "list index out of range. index=#{index} size=#{size}" if index > size
    return prepend(value) if index.zero?
    return append(value) if index == size

    previous_node = at(index - 1)
    new_node = create_node(value, at(index))
    previous_node.next_node = new_node
  end

  def get(value)
    pointer = head
    @size.times do
      return pointer.value if pointer.value == value

      pointer = pointer.next_node
    end
    nil
  end

  def find(value)
    pointer = head
    (0..(size - 1)).each do |index|
      return index if pointer.value == value

      pointer = pointer.next_node
    end
    -1
  end

  def remove(value)
    index = find(value)
    remove_at(index) unless index.negative?
  end

  def contains?(value)
    find(value) >= 0
  end

  def pop
    remove_at(-1)
  end

  def each
    pointer = @head
    until pointer.nil?
      yield(pointer.value)
      pointer = pointer.next_node
    end
  end

  def clear
    size.times { pop }
  end

  def to_s
    format = []

    each { |element| format << "( #{element} )" }
    format << 'nil'
    format.join(' -> ')
  end

  def empty?
    size.zero?
  end

  private

  def normalize_index(index)
    index.negative? ? size + index : index
  end

  def create_node(value, next_node = nil)
    @size += 1
    Node.new(value, next_node)
  end
end
