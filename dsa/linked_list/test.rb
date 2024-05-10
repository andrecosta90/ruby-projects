# frozen_string_literal: true

require './linked_list'

array = LinkedList.new

array.append(1)
array.append(13)
array.prepend(2)
array.prepend(56)
p array.size
puts 
puts array.at(0)
puts array.at(1)
puts array.at(2)
puts array.at(3)
puts
puts array.at(-1)
puts array.at(-2)
puts array.at(-3)
puts array.at(-4)
puts array
# puts array.pop
# puts array.pop
# puts array.pop
# puts array.pop
# puts array.pop
# puts array.pop

# puts array.remove_at(-1)
puts array.remove_at(0)
puts array
array.insert_at(1990, 0)
array.insert_at(1948, array.size)
array.insert_at(1956, 3)
puts array.at(3)
puts array
puts array.find(1990)
puts array.find(1956)
puts array.find(1948)
puts array.find(2002)
puts
puts array.contains?(1990)
puts array.contains?(1956)
puts array.contains?(1948)
puts array.contains?(2002)
puts
puts array.to_s

# p array.at(2)
# p array.at(3)
# p array.at(4)
# puts array.remove_at(-3)
# puts array.remove_at(0)
# puts array.remove_at(0)
# puts array.remove_at(0)
# puts array
# p array
