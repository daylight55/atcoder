n, m = gets.split.map(&:to_i)
graph = Array.new(n) {[]}
m.times do
  u, v = gets.split.map(&:to_i)
  graph[u - 1] << v - 1
  graph[v - 1] << u - 1
end

# 繋がっていない点がある場合はパスグラフではない
# if graph.flatten.uniq.size != n
#   puts "No"
#   exit
# end

# 深さ優先探索
dist = Array.new(n, false)
stack = [0]
dist[0] = true

while stack.size > 0
  pos = stack.pop
  graph[pos].each do |to|
    # 未訪問の時は探索先のスタックに加え、訪問済みとする
    if !dist[to]
      stack << to
      dist[to] = true
    end
  end
end

# 全て訪問できる場合はパスグラフ
if dist.include?(false)
  puts "No"
else
  puts "Yes"
end
