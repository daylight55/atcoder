n, m = gets.split.map(&:to_i)
graph = Array.new(n) {[]}
m.times do
  u, v = gets.split.map(&:to_i)
  graph[u - 1] << v - 1
  graph[v - 1] << u - 1
end

# 幅優先探索
dist = Array.new(n, -1)
queue = [0]
dist[0] = true

while queue.size > 0
  pos = queue.shift
  graph[pos].each do |to|
    # 未訪問の時は探索先のキューに加え、訪問済みとする
    queue << to
    dist[to] = true
  end
end

# 全て訪問できる場合はパスグラフ
if dist.include?(-1)
  puts "No"
else
  # 閉路の場合は1以上の訪問が存在するため、その場合はNo
  if dist.any?{|i| i > 0}
    puts "No"
  else
    puts "Yes"
  end
end
