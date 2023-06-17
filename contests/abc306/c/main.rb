#!/usr/bin/env ruby
N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

ans = Hash.new { |h, k| h[k] = [] }

A.each_with_index do |a, i|
  ans[a] << i + 1
end

# pp ans

result = (1..N).sort_by { |i| ans[i][1] }

puts result.join(' ')
