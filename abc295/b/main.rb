#!/usr/bin/env ruby
R, C = gets.chomp.split.map(&:to_i)
grid = Array.new(R) { gets.chomp.split('') }
bomb_dict = {}

grid.each_with_index { |row, i|
  row.each_with_index { |cell, j|
    if cell =~ /^[1-9]$/
      bomb_dict[[i, j]] = cell.to_i
    end
  }
}

# pp bomb_dict

bomb_dict.each { |(i, j), bomb|
  # 爆弾自身も空き地にする
  grid[i][j] = '.'
  # 爆弾の数値だけ爆発させセルを空き地にする
  (1..bomb).each { |bomb_effect|
    puts "bomb_effect:#{bomb_effect}"
    # 上
    if i - bomb_effect >= 0
      grid[i - bomb_effect][j] = '.'
      # puts "上 bomb! i:#{i} bomb_effect:#{bomb_effect} #{i - bomb_effect}, #{j}"
    end
    # 下
    if i + bomb_effect < R
      grid[i + bomb_effect][j] = '.'
      # puts "下 bomb! i:#{i} bomb_effect:#{bomb_effect} #{i + bomb_effect}, #{j}"
    end
    # 左
    if j - bomb_effect >= 0
      grid[i][j - bomb_effect] = '.'
      # puts "左 bomb! j:#{j} bomb_effect:#{bomb_effect} #{i}, #{j - bomb_effect}"
    end
    # 右
    if j + bomb_effect < C
      grid[i][j + bomb_effect] = '.'
      # puts "右 bomb! j:#{j} bomb_effect:#{bomb_effect} #{i}, #{j + bomb_effect}"
    end
    # 斜め右上
    if i - bomb_effect >= 0 && j + bomb_effect < C
      grid[i - bomb_effect][j + bomb_effect] = '.'
    end
    # 斜め左上
    if i - bomb_effect >= 0 && j - bomb_effect >= 0
      grid[i - bomb_effect][j - bomb_effect] = '.'
    end
    # 斜め右下
    if i + bomb_effect < R && j + bomb_effect < C
      grid[i + bomb_effect][j + bomb_effect] = '.'
    end
    # 斜め左下
    if i + bomb_effect < R && j - bomb_effect >= 0
      grid[i + bomb_effect][j - bomb_effect] = '.'
    end
  }
}

# マンハッタン距離がn以下の座標を返す
def manhattan_distance(n)
  result = []
  (-n..n).each { |i|
    (-n..n).each { |j|
      if i.abs + j.abs <= n
        result << [i, j]
      end
    }
  }
  result
end
