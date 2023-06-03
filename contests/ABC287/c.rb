require 'set'

n, m = gets.split.map(&:to_i)
graph = Array.new(n) { [] }
m.times do
  u, v = gets.split.map(&:to_i)
  u -= 1
  v -= 1
  graph[u] << v
  graph[v] << u
end

if m != n - 1
  puts "No"
  return
end

graph.each do |arr|
  if arr.size > 2
    puts "No"
    return
  end
end

reach = Array.new(n) { false }
que = Queue.new
reach[0] = true
que.push(0)
while !que.empty?
  u = que.pop
  graph[u].each do |v|
    if !reach[v]
      reach[v] = true
      que.push(v)
    end
  end
end

reach.each do |val|
  if !val
    puts "No"
    return
  end
end

puts "Yes"
