#!/usr/bin/env ruby
N, M = gets.chomp.split.map(&:to_i)
A = Array.new(M){gets.chomp.split.map(&:to_i)}

# 隣の人を記録
neigbor_list = {}
persons = (1..N).to_a

A.each_with_index do |a, i|
  a.each_with_index do |person, j|
    # 隣の人を記録
    if j == 0
      neigbor = [A[i][j+1]]
    elsif j == a.size - 1
      neigbor = [A[i][j-1]]
    else
      neigbor = [A[i][j+1], A[i][j-1]]
    end

    # 隣の人リストに追加
    neigbor_list[person] = [] if neigbor_list[person].nil?
    neigbor_list[person] += neigbor
    neigbor_list[person].uniq!
    neigbor_list[person].sort! if neigbor_list[person] != []
  end
end

# pp neigbor_list

# 不仲リスト
hate_list = []
# 隣に来たことがないペアを探し、その数を出力
neigbor_list.each do |person, neigbors|
  if persons - neigbors == persons
    next
  else
    hates = persons - neigbors - [person]
    hates.each do |hate|
      hate_list << [person, hate].sort
    end
  end
end

# pp hate_list.uniq
puts hate_list.uniq.size
