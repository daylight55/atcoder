#!/usr/bin/env ruby
P, Q = gets.chomp.split

distances = [0, 3, 1, 4, 1, 5, 9, 0]

# Aが0, Gが7になるように変換する
p_num = P.ord - 'A'.ord
q_num = Q.ord - 'A'.ord

# p_numとq_numの大きさが逆の場合は入れ替える
if p_num > q_num
  tmp = p_num
  p_num = q_num
  q_num = tmp
end

puts "p_num: #{p_num} q_num: #{q_num}"

# distanceのp_numとq_numの間にある数の合計を求める
sum = 0
(p_num..q_num).each do |i|
  sum += distances[i]
end
