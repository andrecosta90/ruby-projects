# frozen_string_literal: true

# Represents a node in a singly linked list
class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    value.to_s
  end
end
