#!/usr/bin/env ruby
H, W = gets.chomp.split.map{|i| i.to_i}
table = Array.new(H){gets.chomp.split.map{|i| i.to_i}}

(0..H-1).each do |i|
  (0..W-1).each do |j|
    