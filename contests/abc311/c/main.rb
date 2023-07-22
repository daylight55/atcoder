#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)

  graph = Array.new(n)
  (0..n-1).each{|i|
    graph[i] = a[i - 1]
  }

  visited = Array.new(n, false)
  stack = []
  cycle = []

  (0..n-1).each{|start|
    next if visited[start]
    stack.push([start, [start]])

    while !stack.empty?
      v, path = stack.pop
      visited[v] = true
      next_v = graph[v]

      if visited[v]
        cycle_start = path.index(next_v)
        cycle = path[cycle_start..-1]
        break
      else
        stack.push([next_v, path + [next_v]])
      end
    end

    break if !cycle.empty?
  }

  puts cycle.size
  puts cycle.join(" ")
end

main
