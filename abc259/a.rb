#!/usr/bin/env ruby

# input = gets.split(" ").map(&:to_i)
N, M, X, T, D = "1 0 1 3 2".split(" ").map(&:to_i)
tall = 1

if X < M
  for i in 1..X do
    tall = T
  end
else
  for i in 1..X do
    tall += D
  end
end

puts tall
