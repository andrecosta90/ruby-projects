require "./utils.rb"

def substrings(text, substr_array)
  text.downcase.split.reduce(Hash.new(0)) do |res, item|
    substr_array.each do |w|
      if (item.include?(w))
        res[w] += 1
      end
    end
    res
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)

assert(
  substrings("Howdy partner, sit down! How's it going?", dictionary) == { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 })


