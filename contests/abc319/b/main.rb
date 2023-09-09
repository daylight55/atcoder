#!/usr/bin/env ruby
require 'prime'
def main
  n = gets.chomp.to_i

  # 約数列挙
  divisors = []
  (1..n).each do |i|
    divisors << i if n % i == 0
  end
  # 1以上9以下の約数のみになるよう削除
  divisors.delete_if { |i| i < 1 || i > 9 }

  ans = ""
  # 0...nのiを見る
  (0..n).each do |i|

    j_min = 999
    divisors.each do |j|
      # i がN/j の倍数でなければスキップ
      next if i % (n / j) != 0
      j_min = [j_min, j].min
    end

    if j_min != 999
      ans << j_min.to_s
    else
      ans << "-"
    end
  end

  puts ans
end

main
