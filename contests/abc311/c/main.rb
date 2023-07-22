#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)

  graph = a.dup
  visited = Array.new(n, false)
  stack = []
  result = []

  (0..n-1).each{|start|
    next if visited[start]
    stack.push(start)

    while !stack.empty?
      v = stack.pop

      if visited[v]
        cycle_start = result.index(v)
        result = result[cycle_start..-1]
        break
      end

      visited[v] = true
      next_v = graph[v]
      stack.push(next_v)
      result.push(v)
    end
  }

  puts result.size
  puts result.map{|v| v + 1}.join(' ')
end

main
