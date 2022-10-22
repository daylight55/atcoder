#!/bin/env ruby

N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)
# 系譜
genealogies = []

A.each_with_index { |a, i|
  # parent, child1, child2の順
  genealogies.append([a, 2*(i + 1), 2*(i + 1) + 1])
}
# アメーバのリスト
amoebae = genealogies.flatten.uniq
pp amoebae

ans = Array(2 * N + 1)
genealogies.each{ |genealogy|
  parent = genealogy[0]
  puts parent
}
