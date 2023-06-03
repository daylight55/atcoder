#!/usr/bin/env ruby
N = gets.chomp.to_i
S = gets.chomp.chars

count = 0
huka = false
S.each_with_index do |s, i|
  if s == "o"
    count += 1
  elsif s == "x"
    huka = true
  end
end

# puts "count: #{count} huka: #{huka}"

if count > 0 && !huka
  puts "Yes"
else
  puts "No"
end
