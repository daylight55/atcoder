#!/usr/bin/env ruby
N, M = gets.chomp.split(" ").map(&:to_i)
E = []

M.times do
  e = gets.chomp.split(" ").map(&:to_i)
  E.push(e)
end

# Example
# N, M = "7 10".chomp.split(" ").map(&:to_i)
# E = [
#   [1, 7],
#   [5, 7],
#   [2, 5],
#   [3, 6],
#   [4, 7],
#   [1, 5],
#   [2, 4],
#   [1, 3],
#   [1, 6],
#   [2, 7]
# ]

# Eのハッシュを作成
E_map = Array.new(E.flatten.max).map{[]}
E.each{ |e|
  E_map[e[0]-1].push(e)
  E_map[e[1]-1].push(e.reverse)
}

result = []
count = 0
E_map.each_with_index do |e, i|
  e.each do |a|
    E_map[a[1]-1].each do |b|
      next if b.reverse == a
      E_map[b[1]-1].each do |c|
        next if (c.reverse == a and c.reverse == b )
        result.push([a, b, c].flatten.uniq) if c[1] == a[0]
      end
    end
  end
end

puts result.size / 6
