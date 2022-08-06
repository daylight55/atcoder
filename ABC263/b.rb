#!/usr/bin/env ruby
N = gets.chomp.to_i
P = gets.chomp.split(" ").map(&:to_i)

# 系譜
# [parent, child] のリスト
genealogy = []
P.each_with_index.reverse_each do |p, i|
  genealogy << [p, i + 2]
end

count = 1

parent, child = genealogy.reverse!.pop
# Nに行き着くまでループする
# puts "#{parent} #{child}"
while parent != 1
  parent = genealogy.select { |p, c| c == parent }.first[0]
  count += 1
end

puts count
