#!/usr/bin/env ruby
H, W = gets.chomp.split.map(&:to_i)
GRID = Array.new(H) { gets.chomp.chars }

ans = []
# クッキーの範囲を求める
cookies_frame = Array.new(4, nil)
GRID.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    if cell == '#'
      if cookies_frame[0] == nil
        cookies_frame[0] = i
        cookies_frame[1] = j
        cookies_frame[2] = j
        cookies_frame[3] = j
      else
        cookies_frame[0] = [cookies_frame[0], i].min
        cookies_frame[1] = [cookies_frame[1], i].max
        cookies_frame[2] = [cookies_frame[2], j].min
        cookies_frame[3] = [cookies_frame[3], j].max
      end
    end
  end
end

# puts cookies_frame.join(' ')

# クッキーの範囲に.のマスがあれば出力
GRID.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    if cookies_frame[0] <= i && i <= cookies_frame[1] && cookies_frame[2] <= j && j <= cookies_frame[3]
      if cell == '.'
        puts "#{i + 1} #{j + 1}"
        exit
      end
    end
  end
end
