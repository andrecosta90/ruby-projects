# frozen_string_literal: true

require './entry'

class HashMap
  attr_reader :length

  def initialize
    @buckets = []
    @capacity = 16
    @length = 0
    @load_factor = 0.75
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
    puts new_entry
    # puts(length * 1.0 / @capacity)
    grow if (length * 1.0 / @capacity) >= @load_factor

    @buckets[hash(key)] = new_entry
    @length += 1
  end

  def get(key)
    @buckets[hash(key)]
  end

  def has?(key)
    @buckets[hash(key)].nil? ? false : true
  end

  def remove(key)
    return if @length.zero?

    entry = @buckets[hash(key)]
    @buckets[hash(key)] = nil
    @length -= 1
    entry
  end

  def keys
    @buckets.reject(&:nil?).map(&:key)
  end

  def values
    @buckets.reject(&:nil?).map(&:value)
  end

  def entries
    keys.zip(values)
  end

  def to_s
    @buckets.reduce([]) do |acc, entry|
      entry.nil? ? acc : acc.push(entry.to_s)
    end.join(', ')
  end

  private

  def grow
    # To grow our buckets,
    # 1. we create a new buckets list that is DOUBLE the size of
    #  the old buckets list,
    # 2. then we copy all nodes over to the new buckets.
    puts 'TODO #growth'
  end
end
