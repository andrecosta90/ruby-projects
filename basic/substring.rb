# frozen_string_literal: true

require './utils'

def substrings(text, substr_array)
  text.downcase.split.each_with_object(Hash.new(0)) do |item, res|
    substr_array.each do |w|
      res[w] += 1 if item.include?(w)
    end
  end
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

p substrings('below', dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)

assert(substrings('below', dictionary) == { 'below' => 1, 'low' => 1 })

assert(
  substrings("Howdy partner, sit down! How's it going?",
             dictionary) == { 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1,
                              'part' => 1, 'partner' => 1, 'sit' => 1 }
)
