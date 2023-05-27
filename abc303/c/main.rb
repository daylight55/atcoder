#!/usr/bin/env ruby
require 'set'

N, M, H, K = gets.chomp.split.map(&:to_i)
MOVES = gets.chomp.chars
ITEMS = Set.new
M.times do
  ITEMS << gets.chomp.split.map(&:to_i)
end

pos = [0, 0]
health = H

MOVES.each do |move|
  # pp "pos: #{pos}, health: #{health} move: #{move}"

  # Kが負になったら終了
  if health <= 0
    puts 'No'
    exit
  end

  case move
  when 'R'
    # 右に1マス
    pos = [pos[0] + 1, pos[1]]
    health -= 1
  when 'L'
    # 左に1マス
    pos = [pos[0] - 1, pos[1]]
    health -= 1
  when 'U'
    # 上に1マス
    pos = [pos[0], pos[1] + 1]
    health -= 1
  when 'D'
    # 下に1マス
    pos = [pos[0], pos[1] - 1]
    health -= 1
  end

  # アイテムがある場合は拾う
  if ITEMS.include?(pos) && health < K
    health = K
  end
end

# ループを抜けたら移動完了
puts "Yes"
