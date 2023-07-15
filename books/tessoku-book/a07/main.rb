#!/usr/bin/env ruby
def main
  d = gets.chomp.to_i
  n = gets.chomp.to_i
  attend = Array.new(n) { gets.chomp.split.map(&:to_i) }

  # 前日比の来場者数記録
  prv_changes = Array.new(d, 0)
  attend.each do |(l, r)|
    prv_changes[l-1] += 1   # 参加する日は増える
    prv_changes[r] -= 1 unless r >= d # 帰る日は減る
  end

  # 前日比の累積和 = 累積来場者数
  cumulative_attends = prv_changes.cumulative_sum
  puts cumulative_attends[1..-1]
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
