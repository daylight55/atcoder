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

count = 0
E.each do |e|
  a = [e[0], e[1]]
  # puts "a: #{a.join(",")}"
  E.select { |e| (e[0] == a[1]) or (e[1] == a[0]) }.each do |e|
    b = [e[0], e[1]]
    # puts "b: #{b.join(",")}"
    E.select { |e| ((e[0] == b[1]) && (e[1] == a[0])) or ((e[0] == b[0]) && (e[1] == a[1])) }.each do |e|
      c = [e[0], e[1]]
      # puts "c: #{c.join(",")}"
      # pp c
      count += 1
    end
  end
end

puts count
