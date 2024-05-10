# frozen_string_literal: true

require './entry'
require_relative '../linked_list/linked_list'
require_relative '../linked_list/node'

class HashMap
  attr_reader :length

  def initialize
    @buckets = []
    @capacity = 3
    @length = 0
    @load_factor = 0.75

    @capacity.times { @buckets.push(LinkedList.new) }
  end

  def hash(key)
    key = key.to_s
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    # puts "key=#{key} hash=#{hash_code % @capacity}"

    hash_code % @capacity
  end

  def set(key, value)
    new_entry = Entry.new(key, value)
    grow if (length * 1.0 / @capacity) >= @load_factor

    hash_code = hash(key)
    @length += 1 if @buckets[hash_code].empty?

    # puts "length = #{length}"

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
    # todo
    1
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

  def grow
    # To grow our buckets,
    # 1. we create a new buckets list that is DOUBLE the size of
    #  the old buckets list,
    # 2. then we copy all nodes over to the new buckets.
    puts 'TODO #growth'
  end
end
