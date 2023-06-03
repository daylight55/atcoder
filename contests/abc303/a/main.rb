#!/usr/bin/env ruby
N = gets.chomp.to_i
S = gets.chomp.chars
T = gets.chomp.chars

judge = true
S.each_with_index do |s, i|
  # 同じ文字
  if s == T[i]
    next
  else
    next if s == "l" && T[i] == "1"
    next if s == "1" && T[i] == "l"
    next if s == "o" && T[i] == "0"
    next if s == "0" && T[i] == "o"
    judge = false
    # puts "s: #{s}, t: #{T[i]} judge: #{judge}"
    break
  end
end

puts judge ? "Yes" : "No"
