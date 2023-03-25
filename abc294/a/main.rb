#!/usr/bin/env ruby
n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)

ans = []
a.each do |i|
  if i % 2 == 0
    ans << i
  end
end

puts ans.join(" ")
