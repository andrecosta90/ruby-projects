# frozen_string_literal: true

require_relative './linked_list'

array = LinkedList.new

array.append(1)
array.append(13)
array.prepend(2)
array.prepend(56)
p array.size
puts array
array.clear
p array.pop
puts array
