#!/bin/env ruby

N = gets.chomp.to_i
result = 1

for k in 1..N do
  result = k * result
end

puts result
