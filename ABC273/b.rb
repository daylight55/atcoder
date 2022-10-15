#!/bin/env ruby

X, K = gets.chomp.split.map(&:to_i)
ans = X

for digit in 1..K do
  ans = ans.round(-digit)
end

puts ans
