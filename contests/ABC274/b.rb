#!/bin/env ruby

H, W = gets.chomp.split.map(&:to_i)
C = []

H.times {
  row = gets.chomp.chars
  C.append(row)
}

cnt = 0
X = []
W.times { |w|
  H.times { |h|
    cnt += 1  if C[h][w] == "#"
  }
  X.append(cnt)
  cnt = 0
}

puts X.join(" ")