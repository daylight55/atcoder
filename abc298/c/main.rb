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
    if box[j].nil?
      box[j] = {}
      # 箱jに数iを入れる
      box[j][i] = 1
      next
    else
      if box[j][i].nil?
        # 箱jに数iを入れる
        box[j][i] = 1
      else
        # 箱jに数iを追加
        box[j][i] += 1
      end
    end
  elsif event == 2
    i = q[1]
    # 箱iに書かれているiを個数分出力して数をすべて昇順で出力する
    result = []
    box[i].each do |k, v|
      # puts "k: #{k}, v: #{v}"
      result << [k] * v
    end
    puts result.sort.join(" ")
  elsif event == 3
    i = q[1]
    # 数iを含む箱の番号をすべて昇順で出力する
    result = []
    box.each do |k, v|
      result << k if !v[i].nil?
    end
    puts result.sort.join(" ")
  end
end
