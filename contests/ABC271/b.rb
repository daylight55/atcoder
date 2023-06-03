#!/bin/env ruby

N, Q = gets.chomp.split.map(&:to_i)

a = Array.new(N)
N.times { |i|
  _, *a[i] = gets.chomp.split.map(&:to_i)
}

q = Array.new(Q).map{Array.new(2)}
Q.times { |i|
  q[i][0], q[i][1] = gets.chomp.split.map(&:to_i)
}

for query in q do
  s, t = query[0], query[1]
  puts a[s-1][t-1]
end
