# frozen_string_literal: true

require './hashmap'

h = HashMap.new
# puts h.hash(1)
# puts h.hash("andre")

h.set('blue', '33')
h.set('purple', '31')
h.set('red', '76')
puts
# (1..10).each {|i| h.set(i, i*10)}

puts h
# h.remove('blue')
puts
p h.keys
p h.values
puts
p h.entries
# p h.get('blue')
# p h.get('purple')
# p h.get('red')
# p h.get('green')
# puts

# p h.has?('blue')
# p h.has?('purple')
# p h.has?('red')
# p h.has?('green')
# puts h.length


