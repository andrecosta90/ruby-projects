# frozen_string_literal: true

require './hashmap'

h = HashMap.new
# puts h.hash(1)
# puts h.hash("andre")

h.set('blue', '33')
h.set('purple', '31')
h.set('red', '76')
h.set('black', '71')
h.set('yellow', '13')
puts
puts h
puts
p h.has?('yellow')
p h.has?('green')
puts
puts h
# puts h.length
puts
puts h.length
# puts h.remove('black')
puts h.length
# puts h.remove('red')
puts "bellow\n\n"
puts h
p h.keys
p h.values
p h.entries
h.set("red", 1098230123)
puts h
p h.keys
p h.values
p h.entries

# # (1..10).each {|i| h.set(i, i*10)}

# # puts h
# # # h.remove('blue')
# # puts
# # p h.keys
# # p h.values
# # puts
# # p h.entries
# # p h.get('blue')
# # p h.get('purple')
# # p h.get('red')
# # p h.get('green')
# # puts

# # p h.has?('blue')
# # p h.has?('purple')
# # p h.has?('red')
# # p h.has?('green')
# # puts h.length

# p h
