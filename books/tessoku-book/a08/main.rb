#!/usr/bin/env ruby
def main
  h, w = gets.chomp.split.map(&:to_i)
  grid = Array.new(h).map{gets.chomp.split.map(&:to_i)}
  q = gets.chomp.to_i
  questions = Array.new(q).map{gets.chomp.split.map(&:to_i)}

  # 累積和を記録する配列
  z = Array.new(h+1).map{Array.new(w+1, 0)}

  # 横方向の累積和を計算
  (1..h-1).each do |i|
    z[i] = grid[i].cumulative_sum
  end
  # 縦方向の累積和を計算
  (1..w).each do |j|
    (1..h).each do |i|
      z[i][j] = z[i-1][j] + z[i][j]
    end
  end

  # puts "grid:"
  # pp grid
  # puts "z(row):"
  # pp z

  # 左上から右下までの累積和を計算
  questions.each do |(a, b, c, d)|
    puts z[c][d] - z[a-1][d] - z[c][b-1] + z[a-1][b-1]
  end

  # puts "z(column):"
  # pp z


end

# ---------------------------------------------------
# 以下、自前ライブラリ
class Array
  # ref. https://stackoverflow.com/questions/1475808/cumulative-array-sum-in-ruby
  def cumulative_sum
    sum = 0
    self.map{|x| sum += x}.unshift(0) # 頭に0を追加しておく
  end
end

main
