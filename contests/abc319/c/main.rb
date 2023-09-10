#!/usr/bin/env ruby
def main
  grid = Array.new(3) { gets.chomp.split.map(&:to_i) }

  # 行、列、 対角線
  rows = grid
  cols = grid.transpose
  diagonals = [[grid[0][0], grid[1][1], grid[2][2]], [grid[0][2], grid[1][1], grid[2][0]]]

  # 行、列、対角線で同じ数字が2つある数を調べる
  danger_count = 0
  danger_count += rows.count { |row| row.uniq.size == 2 }
  danger_count += cols.count { |col| col.uniq.size == 2 }
  danger_count += diagonals.count { |diagonal| diagonal.uniq.size == 2 }

  # 各行、列、対角線で選ぶ事象数は9C3 = 84通り。同じ数字を連続して選び、かつそのラインの最後の数字を選ぶ事象数は3C2 = 6通り。かつ、その後の6マスの選択パターンは6!。以上よりがっかりするパターンは上記の数分かけて以下のように考えれば良い。
  dissapoint_pattern = 9 * danger_count * 6 * 5 * 4 * 3 * 2 * 1  * danger_count

  # 3×3のマスを全て選ぶパターンは9!通り
  all_pattern = 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

  pp dissapoint_pattern
  pp all_pattern

  # がっかりせず選択する確率を少数第8位まで求める
  puts (all_pattern - dissapoint_pattern).to_f / all_pattern.to_f
end

main
