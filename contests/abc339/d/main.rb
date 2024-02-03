#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  # P: Player, #: Wall, .: Road
  grid = Array.new(n) { gets.chomp.chars }

  # Playerのマスを探す
  players = []
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      players << [i, j] if cell == 'P'
    end
  end

  # 上下左右の移動方向
  moves = [[-1, 0], [1, 0], [0, -1], [0, 1]

  # 2つのPlayerの上下左右方向で、壁または境界までの距離を求める
  player_1 = players[0]
  player_2 = players[1]
  player_1_distances = []
  player_2_distances = []

  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      if cell == '#'
        player_1_distances << -1
        player_2_distances << -1
      else
        player_1_distances << distance([i, j], player_1, grid, moves)
        player_2_distances << distance([i, j], player_2, grid, moves)
      end
    end
  end











end

main
