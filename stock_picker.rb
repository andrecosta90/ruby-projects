require "./utils.rb"

# O(n^2)
def brute_force(array)
  best_value = -1
  best_i = nil
  best_j = nil
  for i in 0..(array.length-1)
    for j in 0..(array.length-1)
      if (i < j)
        current_value = array[j] - array[i]
        if (best_value < current_value)
          best_value = current_value
          best_i = i
          best_j = j
        end
      end
    end
  end
  [best_i, best_j]

end

# O(n)
def stock_picker(array)
  optim = [nil, nil]
  max_diff = -99999
  min_idx = 0
  for i in 1..(array.length-1)
    diff = array[i] - array[min_idx]
    if (max_diff < diff)
      max_diff = diff
      optim = [min_idx, i]
    end
    if array[i] < array[min_idx]
      min_idx = i
    end
  end
  max_diff > 0 ? optim : [nil, nil]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([26,3,6,2,15,8,6,22,1])
p stock_picker([55,1,5,2,5,3,7,6])
p stock_picker([40,20,10,6,4])
p stock_picker([5,8,4,6,9])  


assert(stock_picker([17,3,6,9,15,8,6,1,10]) == brute_force([17,3,6,9,15,8,6,1,10]))
assert(stock_picker([26,3,6,2,15,8,6,22,1]) == brute_force([26,3,6,2,15,8,6,22,1]))
assert(stock_picker([55,1,5,2,5,3,7,6]) == brute_force([55,1,5,2,5,3,7,6]))
assert(stock_picker([40,20,10,6,4]) == brute_force([40,20,10,6,4]))
assert(stock_picker([5,8,4,6,9]) == brute_force([5,8,4,6,9]))
