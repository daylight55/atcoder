#!/usr/bin/env ruby
def dfs(pos, graph, visited)
  visited[pos] = true
  graph[pos].each do |next_pos|
    dfs(next_pos, graph, visited) unless visited[next_pos]
  end
end

def main
  n, m = gets.chomp.split.map(&:to_i)

  graph = Array.new(n+1) { [] }
  visited = Array.new(n+1, false) # インデックスとノード番号を合わせるために、n+1個の配列を用意する
  visited[0] = true # 0は使わないので、trueにしておく

  m.times do |i|
    a, b = gets.chomp.split.map(&:to_i)
    # 双方向に辺を張る
    graph[a] << b
    graph[b] << a
  end

  dfs(1, graph, visited)
  ans = visited.all? ? "The graph is connected." : "The graph is not connected."
  puts ans
end

main
