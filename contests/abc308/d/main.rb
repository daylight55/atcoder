#!/usr/bin/env ruby
H, W = gets.chomp.split.map(&:to_i)
S = Array.new(H) { gets.chomp.chars }

# スタート地点がsでない場合は論外
if S[0][0] != 's'
  puts 'No'
  exit
end

keyword = 'snuke'.chars
keyword_indices = {}
keyword.each_with_index do |char, index|
  keyword_indices[char] = index
end

visited = Array.new(H) { Array.new(W, false) } # 探索済みのマスを管理する配列
queue = [[0, 0, 1]] # キューには現在地の座標と次に探索するキーワードのインデックスを入れる
visited[0][0] = true

# キューが空になるまで幅優先探索
while !queue.empty?
  i, j, index = queue.shift
  visited[i][j] = true
  # ゴールに到達したらYesを出力して終了
  if i == H - 1 && j == W - 1
    puts 'Yes'
    exit
  end

  next if i == H - 1 && j == W - 1
  # 上下左右の隣接するマスを探索
  [[i - 1, j], [i + 1, j], [i , j - 1], [i, j + 1]].each do |ny, nx|
    # グリッドの範囲外や壁の場合は探索しない
    next if ny < 0 || ny >= H || nx < 0 || nx >= W
    next if visited[ny][nx] # 探索済みの場合は探索しない
    next if !keyword.include?(S[ny][nx]) # キーワードが含まれていない場合は探索しない

    # 順番にキーワードを探索していく
    next_index = (index % 5) + 1
    next_keyword = keyword[next_index - 1]
    # キーワードが見つかったらキューに追加
    queue.push([ny, nx, next_index]) if S[ny][nx] == next_keyword
  end

  # pp queue
  # puts '---'
  # pp visited
end

# ゴールに到達しない場合はNoを出力して終了
puts 'No'
