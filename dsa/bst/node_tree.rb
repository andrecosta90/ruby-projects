# frozen_string_literal: true

class NodeTree
  include Comparable

  attr_accessor :data, :left, :right, :n_children

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
    @n_children = 0
  end

  def <=>(other)
    data <=> other.data
  end

  def leaf?
    left.nil? & right.nil?
  end

  def to_s
    @data.to_s
  end
end
