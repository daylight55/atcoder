#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  grid = Array.new(n){ gets.chomp.split('') }
  # ◯のマスをすべて取得する
  circles = []
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      circles << [i, j] if cell == 'o'
    end
  end

  # 条件
  # 1. 組に含まれる3 マスは相異なる。
  # 2. 3 マス全てに o が書かれている。
  # 3. マスのうち、丁度2 つが同じ行にある。
  # 4. マスのうち、丁度2 つが同じ列にある。
  count = 0
  circles.each do |c1|
    # まずは同じ行で2つ目の◯を探す
    c2 = circles.find { |c2| c1[0] == c2[0] && c1[1] != c2[1] }
    pp c2

    next unless c2
    # c2の各列に対して、c1と同じ列でかつc1とc2以外の◯があるかを探す
    c3 = circles.find { |c3| c1[1] == c3[1] && c1[0] != c3[0] && c2[0] != c3[0] }
    pp c3
    next unless c3
    # c3の数が個数になる
    count += c3.size if c3
  end

  puts count

end

main
