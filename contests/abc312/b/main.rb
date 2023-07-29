#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  # #, .のn*mのグリッド
  grid = Array.new(n) { gets.chomp.chars }

  candidates = []
  n.times do |i|
    m.times do |j|
      # 行、列の参照をクリア
      next if i + 1 >= n || i + 2 >= n || i + 3 >= n
      next if j + 1 >= m || j + 2 >= m || j + 3 >= m

      # 横3列、縦3行が#の列の左端の座標をcandidatesに追加
      if grid[i][j] == "#" && grid[i][j+1] == "#" && grid[i][j+2] == "#" &&
         grid[i+1][j] == "#" && grid[i+1][j+1] == "#" && grid[i+1][j+2] == "#" &&
         grid[i+2][j] == "#" && grid[i+2][j+1] == "#" && grid[i+2][j+2] == "#"
        # 更にこの横3列、縦3行の右下側の外の隣接マスが.である場合は候補として追加
        if grid[i][j+3] == "." && grid[i+1][j+3] == "." && grid[i+2][j+3] == "." &&
           grid[i+3][j] == "." && grid[i+3][j+1] == "." && grid[i+3][j+2] == "." &&
           grid[i+3][j+3] == "."
          candidates << [i, j]
        end
      end
    end
  end

  ans = []
  # 候補の座標を基準に、
  candidates.each do |i, j|
    right_bottom_i = i+8
    right_bottom_j = j+8

    # right_bottomがグリッドの範囲外の場合は次の候補へ
    next if right_bottom_i >= n || right_bottom_j >= m

    # 行、列の参照をクリア
    next if right_bottom_i - 1 < 0 || right_bottom_i - 2 < 0 || right_bottom_i - 3 < 0
    next if right_bottom_j - 1 < 0 || right_bottom_j - 2 < 0 || right_bottom_j - 3 < 0

    # right_bottomも同様に横3列、縦3行が#の列の右下であることを確認
    if grid[right_bottom_i][right_bottom_j] == "#" && grid[right_bottom_i][right_bottom_j-1] == "#" && grid[right_bottom_i][right_bottom_j-2] == "#" &&
       grid[right_bottom_i-1][right_bottom_j] == "#" && grid[right_bottom_i-1][right_bottom_j-1] == "#" && grid[right_bottom_i-1][right_bottom_j-2] == "#" &&
       grid[right_bottom_i-2][right_bottom_j] == "#" && grid[right_bottom_i-2][right_bottom_j-1] == "#" && grid[right_bottom_i-2][right_bottom_j-2] == "#"
      # 更にこの横3列、縦3行の左上側の外の隣接マスが.である場合は候補として追加
      if grid[right_bottom_i][right_bottom_j-3] == "." && grid[right_bottom_i-1][right_bottom_j-3] == "." && grid[right_bottom_i-2][right_bottom_j-3] == "." &&
         grid[right_bottom_i-3][right_bottom_j] == "." && grid[right_bottom_i-3][right_bottom_j-1] == "." && grid[right_bottom_i-3][right_bottom_j-2] == "." &&
         grid[right_bottom_i-3][right_bottom_j-3] == "."
        ans << [i, j]
      end
    end
  end

  # i, jそれぞれ1加算
  puts ans.empty? ? "" : ans.map { |i, j| "#{i+1} #{j+1}" }
end

main
