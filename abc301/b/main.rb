#!/usr/bin/env ruby
n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)
a_copy = a.dup

n.times do |i|
  # 隣接する要素の差が2以上ならば、隣接する要素の間を埋める順列を挿入する
  if (a[i] - a[i + 1]).abs >= 2 && i < n - 1
    nums = [*(a[i] + 1)..(a[i + 1] - 1)]

    # 挿入する箇所を決める
    a_copy.insert((i + 1), nums)
    puts "i: #{i} nums: #{nums} a_copy: #{a_copy.flatten.join(" ")}"
  end
end

puts a.flatten.join(" ")
