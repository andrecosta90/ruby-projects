require "./utils.rb"

def substrings(word, substr_array)
  # false
  # { "below" => 1, "low" => 1 }
  
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("below", dictionary)

assert(substrings("below", dictionary) == { "below" => 1, "low" => 1 })