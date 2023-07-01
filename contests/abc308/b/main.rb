#!/usr/bin/env ruby
N, M = gets.chomp.split.map(&:to_i)
C = gets.chomp.split
D = gets.chomp.split
P = gets.chomp.split.map(&:to_i)

other = P[0]
price_table = D.zip(P[1..-1]).to_h
total = 0

C.each_with_index do |c, i|
  if price_table.key?(c)
    total += price_table[c]
  else
    total += other
  end
end

puts total
