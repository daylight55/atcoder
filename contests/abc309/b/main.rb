#!/usr/bin/env ruby
N = gets.chomp.to_i
grid = Array.new(N) { gets.chomp.chars.map(&:to_i) }
grid_org = grid.map(&:dup)

# 時計回りに回転して4隅に来る値を保持
grid_edges = Hash.new
grid_edges["left_top"] = grid[1][0]
grid_edges["right_top"] = grid[0][N - 2]
grid_edges["left_bottom"] = grid[N - 1][1]
grid_edges["right_bottom"] = grid[N - 2][N - 1]

# 時計回りの対象行・対象列を回転
(0..N-1).each do |i|
  (0..N-1).each do |j|
    # 1行目
    if i == 0
      if j == 0
        # 左上は予定の値を入れる
        grid[i][j] = grid_edges["left_top"]
      else
        grid[i][j] = grid_org[i][j - 1]
      end
    # 最終行
    elsif i == N - 1
      if j == N - 1
        # 右下は予定の値を入れる
        grid[i][j] = grid_edges["right_bottom"]
      else
        grid[i][j] = grid_org[i][j + 1]
      end
    # 1列目
    elsif j == 0
      if i == N - 1
        # 左下は予定の値を入れる
        grid[i][j] = grid_edges["left_bottom"]
      else
        grid[i][j] = grid_org[i + 1][j]
      end
    # 最終列
    elsif j == N - 1
      if i == 0
        # 右上は予定の値を入れる
        grid[i][j] = grid_edges["right_top"]
      else
        grid[i][j] = grid_org[i - 1][j]
      end
    # それ以外は何もしない
    else
      next
    end
  end
end

puts grid.map(&:join)
