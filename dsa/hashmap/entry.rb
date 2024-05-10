# frozen_string_literal: true

# Represents an entry in a key-value pair.
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
