#!/usr/bin/env ruby
N, D = gets.chomp.split.map(&:to_i)
HUMANS = Array.new(N) { gets.chomp.split.map(&:to_i) }
HUMANS_ORIGIN = HUMANS.dup

# 感染記録を保存する配列
infection = Hash.new("No")
# 感染者の座標一覧を管理する配列
infection_humans = []
infection_humans << HUMANS[0]
infection[HUMANS[0]] = "Yes"
HUMANS.delete_at(0)

infection_humans.each_with_index do |infection_human, i|
  x, y = infection_human
  HUMANS.each_with_index do |human, j|
    if Math.sqrt((x - human[0]) ** 2 + (y - human[1]) ** 2) <= D
      infection[[human[0], human[1]]] = "Yes"
      infection_humans << human
      HUMANS.delete_at(j)
    end
  end
end

HUMANS_ORIGIN.each do |human|
  puts infection[human]
end
