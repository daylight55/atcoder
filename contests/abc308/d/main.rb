#!/usr/bin/env ruby
H, W = gets.chomp.split.map(&:to_i)
S = Array.new(H) { gets.chomp.chars }

if S[0][0] != 's'
  puts 'No'
  exit
end

queue = [[0, 0, 1]]
visited = Array.new(H) { Array.new(W, false) }
keyword = 'snuke'.chars

while !queue.empty?
  i, j, index = queue.shift
  visited[i][j] = true
  # ゴールに到達したらYesを出力して終了
  if i == H - 1 && j == W - 1
    puts 'Yes'
    exit
  end

  next if y == H - 1 && x == W - 1
  # 上下左右の隣接するマスを探索
  [[y - 1, x], [y + 1, x], [y , x - 1], [y, x + 1]].each do |ny, nx|
    # グリッドの範囲外や壁の場合は探索しない
    next if ny < 0 || ny >= H || nx < 0 || nx >= W
    # 探索済みの場合は探索しない
    next if visited[ny][nx]

    next_index = (index % 5) + 1
    next_keyword = keyword[next_index]
    queue.push([ny, nx, next_index]) if S[ny][nx] == next_keyword
  end
end

# ゴールに到達しない場合はNoを出力して終了
puts 'No'
