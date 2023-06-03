#!/usr/bin/env ruby
W, H = gets.chomp.split.map(&:to_i)
N = gets.chomp.to_i
STRAWBERRIES = Array.new(N) { gets.chomp.split.map(&:to_i) }
A = gets.chomp.to_i
CUTS_X = gets.chomp.split.map(&:to_i)
B = gets.chomp.to_i
CUTS_Y = gets.chomp.split.map(&:to_i)

# カット後のピースに含まれるイチゴの数を記録
strawberry_blocks = Hash.new(0)

STRAWBERRIES.each do |strawberry_x, strawberry_y|
  # イチゴの上界にあたるラインを取得する
  x_blocK_line = CUTS_X.bsearch { |cut_x| cut_x > strawberry_x } || W
  y_blocK_line = CUTS_Y.bsearch { |cut_y| cut_y > strawberry_y } || H
  strawberry_blocks[[x_blocK_line, y_blocK_line]] += 1
end

# カウントされたイチゴのブロック数が、カットで作られる総ブロック数より少ない場合は、イチゴを含まないブロックが存在するため最小値は0
min = strawberry_blocks.size < (A + 1) * (B + 1) ? 0 : strawberry_blocks.values.min
max = strawberry_blocks.values.max
# ストロベリーブロックの最大値と最小値を出力
puts "#{min} #{max}"
