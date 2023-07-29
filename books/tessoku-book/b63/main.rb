#!/usr/bin/env ruby
def main
  r, c = gets.chomp.split.map(&:to_i)
  start = gets.chomp.split.map(&:to_i)
  goal = gets.chomp.split.map(&:to_i)

  graph = Array.new(r){ gets.chomp.split }
  dist = Array.new(r){ Array.new(c, -1) }
  queue = []

  dist[0][0] = 1
  queue.push(graph[0][0])

end

main
