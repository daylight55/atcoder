#!/usr/bin/env ruby
N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

ans = []
pushed = []
first = -1
(1..N).each_with_index do |x, i|

  if first == x
    ans << i
    pushed << x
    first = -1
    next
  end

  puts "first: #{first}, x: #{x} i: #{i} ans: #{ans} pushed: #{pushed}"

  # break if pushed.all? { |p| N.include?(p) }

  first = x
end

puts ans.join(" ")
