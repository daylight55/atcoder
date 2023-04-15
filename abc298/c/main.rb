#!/usr/bin/env ruby
require "set"

N = gets.chomp.to_i
Q = gets.chomp.to_i
query = Array.new(Q){gets.chomp.split.map(&:to_i)}

box = {}

query.each do |q|
  event = q[0]
  if event == 1
    i = q[1]
    j = q[2]
    box[j] = [] if box[j].nil?
    box[j] << i
  elsif event == 2
    i = q[1]
    # 箱iに書かれている数をすべて出力する
    puts box[i].sort.join(" ")
  elsif event == 3
    i = q[1]
    # 数iを含む箱の番号をすべて昇順で出力する
    result = []
    box.each do |k, v|
      result << k if v.include?(i)
    end
    puts result.sort.join(" ")
  end
end
