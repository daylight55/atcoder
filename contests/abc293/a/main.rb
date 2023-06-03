#!/usr/bin/env ruby
input = gets.chomp.chars

(1..(input.size/2)).each{ |i|
  # puts "i: #{i} #{2*i - 2} #{2*i - 1}"
  # puts "input[2*i - 2]: #{input[2*i - 2]} input[2*i - 1]: #{input[2*i - 1]}"
  tmp = input[2*i - 1]
  input[2*i - 1] = input[2*i - 2]
  input[2*i - 2] = tmp
}

puts input.join("")
