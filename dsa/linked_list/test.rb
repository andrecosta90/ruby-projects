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
# puts array.remove_at(-3)
# puts array.remove_at(0)
# puts array.remove_at(0)
# puts array.remove_at(0)
# puts array
# p array
