#!/usr/bin/env ruby
N = gets.chomp.to_i
# 入力例: 0 240 720 1320 1440 1800 2160
A = gets.chomp.split.map(&:to_i)
Q = gets.chomp.to_i
T = Array.new(Q) { gets.chomp.split.map(&:to_i) }

# Aを2こずつに分ける
a = A.each_slice(2).to_a


# 起床睡眠の状態。
# StartからEndをの配列をキーとし、
# sleep_state = {}
# SLEEP_RECORD.each_with_index do |record, i|
#   # 奇数
#   if i.odd?
#     sleep_state[record[0]] = record[1]
#   # 偶数
#   else
#     sleep_state[record[0]] = record[1]
#   end
# end
