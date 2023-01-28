n, m = gets.split.map(&:to_i)
graph = Array.new(n) {[]}
m.times do
  u, v = gets.split.map(&:to_i)
  graph[u - 1] << v - 1
  graph[v - 1] << u - 1
end

# 幅優先探索
dist = Array.new(n, false)
queue = [0]
dist[0] = true

while queue.size > 0
  pos = queue.shift
  graph[pos].each do |to|
    # 閉路の入力の時常に訪問済みの経路に再度当たるためNoを出力し終了
    # pp "to: #{to}"
    if dist[to]
      puts "No"
      exit
    # 未訪問の時は探索先のキューに加え、訪問済みとする
    else
      next if dist[to]
      queue << to
      dist[to] = true
      # pp "queue: #{queue}"
      # pp "dist: #{dist}"
    end
  end
end

# 全て訪問できる場合はパスグラフ
if dist.include?(false)
  puts "No"
else
  puts "Yes"
end
