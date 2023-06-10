#!/usr/bin/env ruby
H, W = gets.chomp.split.map(&:to_i)
GRID = Array.new(H) { gets.chomp.chars }

ans = []

GRID.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    if cell == '#'
      # 自分の右に'#'があれば継続
      next if GRID[i][j + 1] == '#'

      # puts "i: #{i}, j: #{j}"
      # puts "GRID[i][j + 1]: #{GRID[i][j + 1]} GRID[i + 1][j]: #{GRID[i + 1][j]}"

      # 自分の右が穴抜けかつ、自分の下に'#'がある
      if GRID[i][j + 1] == '.' && GRID[i + 1][j] == '#'
        # 左が# (穴抜け後に読んだ右端が誤読)
        if j - 1 >= 0 && GRID[i][j - 1] == '#'
          if i - 1 >= 0 && GRID[i - 1][j] == '#'
            ans = [i, j + 1]
            break
          end
        end
        ans = [i, j + 1]
        break
      end
    end
  end
end

puts ans.map{|i| i + 1}.join(' ')
