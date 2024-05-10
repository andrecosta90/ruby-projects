# frozen_string_literal: true

class Entry
  attr_reader :key, :value

  def initialize(key, value = nil)
    @key = key
    @value = value
  end

  def ==(other)
    key == other.key
  end

  def to_s
    "(#{key} : #{value})"
  end
end
