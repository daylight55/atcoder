#!/bin/env/ruby

L, R = gets.split.map(&:to_i)
S = "atcoder"
puts S.slice(L-1, R-L+1)
