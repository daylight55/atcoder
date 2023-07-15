#!/usr/bin/env ruby
def main
  n , q = gets.chomp.split.map(&:to_i)
  a = gets.chomp.split.map(&:to_i)
  questions = Array.new(q) { gets.chomp.split.map(&:to_i) }

  # 累積和を計算
  s = a.cumulative_sum

  questions.each do |(l, r)|
    puts s[r] - s[l-1]
  end
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
