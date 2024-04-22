# frozen_string_literal: true

require './utils'

def bubble_sort(array)
  array = Array.new(array)
  (0..(array.length - 1)).each do |i|
    swapped = false
    (0..(array.length - 2 - i)).each do |j|
      if array[j] > array[j + 1]
        swapped = true
        array[j], array[j + 1] = array[j + 1], array[j]
      end
    end
    break unless swapped
  end
  array
end

array = [4, 3, 78, 2, 0, 2]
p bubble_sort(array)

10.times do |_k|
  array = Array.new(5) { rand(0..1000) }
  assert(bubble_sort(array) == array.sort)
end
