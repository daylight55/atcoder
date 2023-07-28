#!/usr/bin/env ruby
n, m = gets.chomp.split.map(&:to_i)
graph = Array.new(n+1) { [] }
m.times do |i|
  a, b = gets.chomp.split.map(&:to_i)
  graph[a] << b
  graph[b] << a
end

dist = Array.new(n+1, -1)
queue = []
dist[1] = 0
queue << 1

while !queue.empty?
  pos = queue.shift
  graph[pos].each do |to|
    next if dist[to] != -1
    dist[to] = dist[pos] + 1
    queue << to
  end
end

dist.shift
puts dist
