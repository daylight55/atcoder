#!/usr/bin/env ruby
n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)
insert_targets = []

n.times do |i|
  # 隣接する要素の差が2以上のインデックスのペアを記録する
  if i < n - 1
    if (a[i] - a[i + 1]).abs >= 2
      insert_targets << [i, i + 1]
    end
  end
end

# pp insert_targets

insert_targets.each do |target|
  # その数字の間を埋める連番を挿入する
  # 左が大きい時
  if a[target[0]] > a[target[1]]
    nums = (a[target[1]] + 1..a[target[0]] - 1).to_a.reverse
    a.insert(target[1], nums).flatten!
  # 右が大きい時
  else
    nums = (a[target[0]] + 1..a[target[1]] - 1).to_a
    a.insert(target[1], nums).flatten!
  end

  # 今回追加した対象以降のターゲットのインデックスを更新する
  insert_targets.map! do |t|
    if t[0] > target[0]
      [t[0] + nums.length, t[1] + nums.length]
    else
      t
    end
  end
end

puts a.flatten.join(" ")
