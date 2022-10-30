#!/bin/env ruby

N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

T = A.tally
pp T
pp *T.keys.sort.reverse
pp T.values_at(*T.keys.sort.reverse)

# puts T.values_at(*T.keys.sort.reverse),[0]*(N-T.size)
