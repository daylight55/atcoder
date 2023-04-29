#!/usr/bin/env ruby
H, W = gets.chomp.split.map{|i| i.to_i}
C = Array.new(H) { gets.chomp.chars }

N = [H, W].min
s = Array.new(N, 0)

# バツ印の中心になりえる座標を調べる
centers = []
C.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    # X方向のマスに#があるかを調べる
    if cell == "#"
      down = i + 1 > H ? H - 1 : i + 1
      up = i - 1 < 0 ? 0 : i - 1
      right = j + 1 > W ? W - 1 : j + 1
      left = j - 1 < 0 ? 0 : j - 1
      if C[up][left] == "#" && C[up][right] == "#" && C[down][left] == "#" && C[down][right] == "#"
        # 中心リストに追加する
        centers << [i, j]
       end
    end
  end
end

# pp centers

# 各バツ印の中心について、そのサイズを調べる
centers.each do |center|
  # 各座標でX方向に#がいくつあるかを調べる
  # #がある数に応じてサイズが決まる
  size = 0
  x = center[0]
  y = center[1]
  N.times{ |i|
    down = x + i > H ? H - 1 : x + i
    up = x - i < 0 ? 0 : x - i
    right = y + i > W ? W - 1 : y + i
    left = y - i < 0 ? 0 : y - i

    # X方向のマスに#があるかを調べる
    if C[up][left] == "#" && C[up][right] == "#" && C[down][left] == "#" && C[down][right] == "#"
      # サイズを更新する
      size += 1
    else
      s[size] += 1
      break
    end
  }
end

s.shift
s.shift
s << 0
s << 0
puts s.join(" ")
