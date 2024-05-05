# frozen_string_literal: true

require './node'

# Represents a singly linked list data structure.
class LinkedList
  attr_reader :size

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    node = create_node(value)
    if empty?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(value)
    node = create_node(value)
    if empty?
      @tail = node
    else
      node.next_node = @head
    end
    @head = node
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def shift(remove: true)
    return nil if empty?

    node = @head
    if remove
      @head = node.next_node
      node.next_node = nil
      decrement
      @tail = @head if size <= 1
    end
    node.value
  end

  def swap(pointer, remove: true)
    return nil if empty?

    node = pointer.next_node
    if remove
      @tail = pointer if @tail == node
      pointer.next_node = node.next_node
      node.next_node = nil
      decrement
    end
    node.value
  end

  def at(index, remove: false)
    index = normalize_index(index)

    return nil if empty? || index.abs >= size

    return shift(remove: remove) if index.zero?

    counter = 0
    pointer = @head
    until pointer.next_node.nil?
      return swap(pointer, remove: remove) if counter + 1 == index

      counter += 1
      pointer = pointer.next_node
    end
  end

  def remove_at(index)
    at(index, remove: true)
  end

  def find(value)
    index = 0

    pointer = @head
    until pointer.nil?
      return index if pointer.value == value

      index += 1
      pointer = pointer.next_node
    end
  end

  def contains?(value)
    !find(value).nil?
  end

  def insert_in_middle(value, index)
    counter = 0
    pointer = @head
    until pointer.nil?
      if counter + 1 == index
        insert_after(pointer, value)
        return
      end
      counter += 1
      pointer = pointer.next_node
    end
  end

  def insert_after(node, value)
    new_node = create_node(value)
    new_node.next_node = node.next_node
    node.next_node = new_node
  end

  def insert_at(value, index)
    index = normalize_index(index)

    return nil if index.abs > size

    if index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      insert_in_middle(value, index)
    end
  end

  def empty?
    @head.nil?
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

  def create_node(value)
    increment
    Node.new(value)
  end

  def increment
    @size += 1
  end

  def decrement
    @size -= 1
  end

  def normalize_index(index)
    index.negative? ? size - index.abs : index
  end
end
