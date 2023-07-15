#!/usr/bin/env ruby
def main
  n, p, q = gets.chomp.split.map(&:to_i)
  d = gets.chomp.split.map(&:to_i)

  # qとdの最小値の合計
  order_combo = d.min + q

  # pと比較して、小さい方を出力
  puts [order_combo, p].min
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
