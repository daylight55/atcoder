#!/usr/bin/env ruby
N = gets.chomp.to_i
a = Array.new(N) { gets.chomp.split.map(&:to_i) }
b = Array.new(N) { gets.chomp.split.map(&:to_i) }

dict = {}
4.times do
  # 各座標ごとにflagを管理するmap
  dict = {}

  # bからaを引いたら-1の要素が存在するかどうかを調べる
  a.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      if  cell == 1
        if b[i][j] == 1
          # 1の時一致
          dict[[i, j]] = true
        else
          # 0の時不一致
          dict[[i, j]] = false
        end
      end
    end
  end

  # dictの要素を出力
  # puts "dict = #{dict}"

  # 1つでも-1の要素が存在すると、dictのvalueはfalseになる
  if dict.values.all?
    puts 'Yes'
    exit
  end

  # 左回転
  a = a.transpose.reverse
end

# 4回回転した後に、dictのvalueが全てtrueになっているかどうかを調べる
if !dict.values.all?
  puts 'No'
else
  puts 'Yes'
end
