#!/usr/bin/env ruby
N = gets.chomp.to_i
S = gets.chomp.chars

ans = ""
S.each_with_index do |s|
  ans += s
  ans += s
end

puts ans
