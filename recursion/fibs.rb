# frozen_string_literal: true

# fibs

def fibs_it(n)
  return n if n <= 1

  fib = 0
  f0 = 0
  f1 = 1
  (2..n).each do |_|
    fib = f0 + f1
    f0 = f1
    f1 = fib
  end
  fib
end

def fibs(n)
  return n if n <= 1

  fibs(n - 1) + fibs(n - 2)
end

(0..10).each do |i|
  puts "#{i} :: #{fibs_it(i)} | #{fibs(i)}"
end
