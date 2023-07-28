#!/usr/bin/env ruby
def dfs(pos, graph, visited, path)
  if visited[pos] # すでに訪れている場合は、cycleがあるということ
    cycle = path[path.index(pos)..-1] # cycleの部分を抜き出す
    return cycle
  end

  visited[pos] = true # 訪れたことを記録
  path << pos # 訪れた順番を記録

  graph[pos].each do |next_pos|
    cycle = dfs(next_pos, graph, visited, path) # cycleを返す
    return cycle if cycle
  end
end

def main
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)
  graph = Array.new(n+1) { [] }
  a.each_with_index { |v, i| graph[i] << v }
  graph.unshift([0]) # インデックスとノード番号を合わせるために、0を先頭に追加する

  visited = Array.new(n+1, false) # インデックスとノード番号を合わせるために、n+1個の配列を用意する
  visited[0] = true # 0は使わないので、trueにしておく

  # 全てのノードからdfsを開始する
  (1..n).each do |v|
    next if visited[v] # すでに訪れている場合は、次のノードへ
    cycle = dfs(v, graph, visited, [])
    if cycle
      puts cycle.size
      puts cycle.join(' ')
      exit
    end
  end
end

main
