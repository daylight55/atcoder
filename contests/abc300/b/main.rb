#!/usr/bin/env ruby
H, W = gets.chomp.split.map{|i| i.to_i}
A = Array.new(H) { gets.chomp.chars }
B = Array.new(H) { gets.chomp.chars }

H.times do |i|
  W.times do |j|
    # 縦方向のシフトを行う
    a_vertical = []
    H.times do |k|
      row = []
      W.times do |l|
        row << A[(i - k) % H][(j - l) % W]
      end
      a_vertical << row
    end

    # 横方向のシフトを行う
    a_horizontal = []
    W.times do |k|
      row = []
      H.times do |l|
        row << a_vertical[l][(j - k) % W]
      end
      a_horizontal << row
    end

    # pp a_horizontal

    # a_horizontal と B を比較する

    # puts "==========B=============="
    # pp B
    if a_horizontal == B
      puts "Yes"
      exit
    end
  end
end

# AとBが一致する場合はYesを出力する
if A == B
  puts "Yes"
else
  puts "No"
end
