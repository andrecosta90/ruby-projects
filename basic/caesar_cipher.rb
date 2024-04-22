# frozen_string_literal: true

require './utils'

def caesar_cipher(message, shift_factor = 1)
  message.split('').map do |char|
    if char.ord.between?(97, 122) || char.ord.between?(65, 90)
      base = char.ord < 91 ? 65 : 97
      char = (((char.ord + shift_factor - base) % 26) + base).chr
    end
    char
  end.join('')
end

puts caesar_cipher('What a string!', 5)
puts caesar_cipher('HELLO', 13)
puts caesar_cipher('hello, world', 13)
puts caesar_cipher('be sure to drink your Ovaltine', 13)

assert(caesar_cipher('What a string!', 5) == 'Bmfy f xywnsl!')
assert(caesar_cipher('HELLO', 13) == 'URYYB')
assert(caesar_cipher('hello, world', 13) == 'uryyb, jbeyq')
assert(caesar_cipher('be sure to drink your Ovaltine', 13) == 'or fher gb qevax lbhe Binygvar')
