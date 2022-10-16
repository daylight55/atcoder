#!/bin/env ruby

N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)
C = Array.new(N, 0)
cache = A.uniq.map { |x| [x, nil]}.to_h

for i in 0..N-1 do
  if cache[A[i]] == nil
    r = A.bsearch{ |n| n > A[i] }.uniq.length
    cache[A[i]] = r
  else
    r = cache[A[i]]
  end
  C[r] = C[r] + 1
end

puts C
