#!/usr/bin/env ruby
N = gets.chomp.to_i

# 0から100まで5刻みの配列
water = (0..100).step(5).to_a

puts water.min_by { |x, _| (N - x).abs }
