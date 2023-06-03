#!/usr/bin/env ruby
W, H = gets.chomp.split.map(&:to_i)
N = gets.chomp.to_i
STRAWBERRIES = Array.new(N) { gets.chomp.split.map(&:to_i) }
A = gets.chomp.to_i
CUTS_X = gets.chomp.split.map(&:to_i)
B = gets.chomp.to_i
CUTS_Y = gets.chomp.split.map(&:to_i)

# STRAWBERRIES: イチゴの座標 (x, y)
# A: 横方向のカットの数
# CUTS_X: 横方向のカットの座標 x
# B: 縦方向のカットの数
# CUTS_Y: 縦方向のカットの座標 y

# カット後のピースに含まれるイチゴの数を記録
strawberry_blocks = {}

CUTS_X.each do |cut_x|
  CUTS_Y.each do |cut_y|
    # カット後のピースの左下の座標を計算
    x = cut_x
    y = cut_y

    # カット後のピースに含まれるイチゴの数を計算
    strawberry_blocks[[x, y]] = 0
    STRAWBERRIES.each do |strawberry|
      # カットの領域にあるかどうかを判定
      

    end
  end
end

# ストロベリーブロックの最大値と最小値を出力
puts "#{strawberry_blocks.values.min} #{strawberry_blocks.values.max}"
