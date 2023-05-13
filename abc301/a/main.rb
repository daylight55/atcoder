#!/usr/bin/env ruby
N = gets.chomp.to_i
S = gets.chomp.chars

t_count = 0
a_count = 0

S.each do |s|
  if s == "T"
    t_count += 1
    break if t_count >= N / 2
  else
    a_count += 1
    break if a_count >= N / 2
  end
end

puts t_count > a_count ? "T" : "A"
