#!/usr/bin/env ruby
def main
  h, w, n = gets.chomp.split.map(&:to_i)

  grid = Array.new(h) { Array.new(w, '.') }
  pos = [0, 0]
  next_direction = [-1, 0]

  # グリッドはトーラス上に歩く
  n.times do
    if grid[pos[0]][pos[1]] == '.'
      grid[pos[0]][pos[1]] = '#'
      next_direction = [next_direction[1], -next_direction[0]]
    else
      grid[pos[0]][pos[1]] = '.'
      next_direction = [-next_direction[1], next_direction[0]]
    end
    pos = [pos[0] + next_direction[0], pos[1] + next_direction[1]]
    pos[0] = (pos[0] + h) % h
    pos[1] = (pos[1] + w) % w
  end

  grid.each{ |row| puts row.join('') }
end

main
