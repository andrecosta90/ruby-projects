# frozen_string_literal: true

require_relative './hashmap'

h = HashMap.new

h.set('blue', '33')
h.set('purple', '31')
h.set('red', '76')
h.set('black', '71')
h.set('yellow', '13')

p h.keys
p h.values
p h.entries

puts h

# (1..100000000).each { |i| h.set(i, i * 10) }

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
