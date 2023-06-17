#!/usr/bin/env ruby
N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

ans = {}

A.each_with_index do |a, i|
  ans[a] << i + 1
end

(1..N).each do |n|
  puts ans[n][1].join(' ')
end
