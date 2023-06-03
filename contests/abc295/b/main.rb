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

bomb_dict.each { |(i, j), b|
  # 爆弾自身も空き地にする
  grid[i][j] = '.'
  # 爆弾の数値だけ爆発させセルを空き地にする
  bomb_effects = []
  # セル境界内の爆発範囲を計算する
  bomb_up = i - b < 0 ? 0 : i - b
  bomb_down = i + b >= R ? R - 1 : i + b
  bomb_left = j - b < 0 ? 0 : j - b
  bomb_right = j + b >= C ? C - 1 : j + b

  (bomb_up..bomb_down).each { |i_bomb_effect|
    (bomb_left..bomb_right).each { |j_bomb_effect|
      if (i_bomb_effect - i).abs + (j_bomb_effect - j).abs <= b
        bomb_effects << [i_bomb_effect, j_bomb_effect]
        # pp bomb_effects
      end
    }
  }

  bomb_effects.each { |(i, j)|
    if grid[i][j] == '#'
      grid[i][j] = '.'
    end
  }
}

puts grid.map { |row| row.join('') }
