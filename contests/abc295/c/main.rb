#!/usr/bin/env ruby
N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

ans = 0
A.tally.each{ |k, v|
  ans += v / 2
}

puts ans
