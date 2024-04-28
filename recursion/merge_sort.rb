# frozen_string_literal: true

def merge(left, right)
  return left if right.empty?
  return right if left.empty?

  smallest_element = left[0] > right[0] ? right.shift : left.shift
  [smallest_element].concat(merge(left, right))
end

def merge_sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left = merge_sort(array[0..mid - 1])
  right = merge_sort(array[mid..array.length])
  merge(left, right)
end

p merge_sort([7, 6, 2, 5, 1, 0, 3, 4])
p merge_sort([1, 8, 9, 9, 2, 0, 3, 4])
p merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
p merge_sort([105, 79, 100, 110])

1000.times do
  size = rand(3..1001)
  array = Array.new(size) { rand(0...10_000) }
  puts 'ERROR' unless array.sort == merge_sort(array)
end
