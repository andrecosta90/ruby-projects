# frozen_string_literal: true

require_relative './entry'
require_relative '../linked_list/linked_list'
require_relative '../linked_list/node'

# Represents a hash map data structure.
class HashMap
  attr_reader :length

  # Initializes a new hash map with a specified capacity.
  #
  # @param capacity [Integer] The initial capacity of the hash map. Defaults to 16 if not provided.
  def initialize(capacity = 16)
    @capacity = capacity

    @buckets = []
    @length = 0
    @load_factor = 0.75

    @capacity.times { @buckets.push(LinkedList.new) }
  end

  def hash(key)
    key = key.to_s
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @capacity
  end

  def set(key, value)
    new_entry = Entry.new(key, value)
    grow if (length * 1.0 / @capacity) >= @load_factor

    hash_code = hash(key)
    @length += 1 if @buckets[hash_code].empty?

    @buckets[hash_code].remove(new_entry) if @buckets[hash_code].contains?(new_entry)

    @buckets[hash_code].append(new_entry)
  end

  def get(key)
    item = @buckets[hash(key)].get(Entry.new(key))
    item&.value
  end

  def has?(key)
    get(key).nil? ? false : true
  end

  def remove(key)
    return if @length.zero?

    hash_code = hash(key)
    item = @buckets[hash_code].remove(Entry.new(key))

    @length -= 1 if @buckets[hash_code].empty?
    item&.value
  end

  def clear
    @length = 0
    @buckets.reject(&:empty?).each(&:clear)
  end

  def entries
    array = []
    @buckets.reject(&:empty?).each do |list|
      list.each { |element| array << [element.key, element.value] }
    end
    array
  end

  def keys
    entries.map { |row| row[0] }
  end

  def values
    entries.map { |row| row[1] }
  end

  def to_s
    @buckets.reduce([]) do |acc, entry|
      entry.nil? ? acc : acc.push(entry.to_s)
    end.join(', ')
  end

  private

  # Doubles the capacity of the hash map and rehashes all key-value pairs.
  def grow
    buckets_copy = @buckets.dup

    initialize(@capacity * 2)
    buckets_copy.each do |list|
      list.each { |element| set(element.key, element.value) }
      list.clear
    end
  end
end
