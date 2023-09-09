#!/usr/bin/env ruby
def main
  grid = Array.new(3) { gets.chomp.split.map(&:to_i) }

  # 3×3のマスを重複なく全てランダムに選択する全事象
  all_pattern = (1..9).to_a.permutation.to_a
  # 全事象の数
  all_count = all_pattern.size

  # 高橋くんががっかりするパターン数
  dessapoint_count = 0

  # 全事象で調べる
  all_pattern.each do |pattern|
    # 初めに2つ選択する座標のみ取り出す
    first_select = pattern.each_slice(3).to_a.slice(0, 2)

    # 高橋くんのがっかりステータス
    takahashi_wakuwaku = true

    # がっかりするパターンを見ていく
    # 各行、各列について2つの数字が等しく、最後が異なるか
    (0..2).each do |i|
      rows = [grid[i][0], grid[i][1], grid[i][2]]
      cols = [grid[0][i], grid[1][i], grid[2][i]]

      if (rows.count(pattern[i]) == 2 && rows.count(pattern[i + 1]) == 1) ||




  # がっかりせずに済む確率
  not_dessapoint_probability = all_count - dessapoint_count / all_count.to_f

  # 絶対誤差が10^−8以下になるように出力
  puts not_dessapoint_probability.round(8)




end


main
