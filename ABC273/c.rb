#!/bin/env ruby

N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)
r = A.sort.uniq
h = r.map { |x| [x, nil] }.to_h
ans = Array.new(N, 0)

for i in 0..N-1 do
  larger_num = r.size - r.index(i) - 1
  h[i] = larger_num
end

for i in 0..N-1 do
  ans[i] = h[A[i]]
end

for k in 0..N-1 do
  t = ans.tally[k] || 0
  puts t
end
