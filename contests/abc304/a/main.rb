#!/usr/bin/env ruby
N = gets.chomp.to_i
T = Array.new(N) { gets.chomp.split }

# T.sort_by! { |t| t[1].to_i }
min_index = T.index(T.min_by { |t| t[1].to_i })
N.times do |i|
  puts T[(min_index + i) % N][0]
end
