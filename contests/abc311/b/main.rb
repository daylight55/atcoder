#!/usr/bin/env ruby
def main
  n, d = gets.chomp.split.map(&:to_i)
  s = Array.new(n){gets.chomp.chars}
  # sの各配列を◯を1、×を0になるよう変換する
  s = s.map{|arr| arr.map{|char| char == 'o' ? 1 : 0}}
  # sの列ごとの和を求める
  sum = Array.new(d){0}
  s.each{|arr|
    arr.each_with_index{|v, i|
      sum[i] += v
    }
  }

  # sumがn以外の要素をすべて-1にする
  sum = sum.map{|v| v == n ? v : -1}

  # 断続しているsumの-1以外の要素が連続している数を数える
  count = []
  count_part = 0

  sum.each_with_index{|v, i|

    # puts "n: #{n}, v: #{v}, i: #{i}, count_part: #{count_part}, count: #{count} sum.size - 1: #{sum.size - 1}"

    if i == sum.size - 1 && v == n
      count_part += 1
      count << count_part
    elsif v == n
      count_part += 1
    else
      count << count_part
      count_part = 0
    end
  }
  puts count.max
end

main
