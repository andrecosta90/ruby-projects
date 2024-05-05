# frozen_string_literal: true

require './linked_list'

array = LinkedList.new

array.append(1)
array.append(13)
p array.size

# puts array
array.append(59)
array.prepend(-25)
array.prepend(-48)
array.append(123)
puts array
puts array.size
puts array.remove_at(2)
puts array.remove_at(4)
puts array.remove_at(1)
puts array.remove_at(55)
puts array
puts array.head
puts array.tail
puts array.size
puts array.insert_at(42, 3)
puts array
puts array.pop
puts array
