#!/usr/bin/env ruby
N, D = gets.chomp.split.map(&:to_i)
HUMANS = Array.new(N) { gets.chomp.split.map(&:to_i) }

# 感染記録を保存する配列
infection = Array.new(N, "No")
# 感染者の座標一覧を管理する配列
infection_humans = []
infection_humans << HUMANS[0]
HUMANS.delete_at(0)
infection[0] = "Yes"

infection_humans.each_with_index do |infection_human, i|
  pp infection_humans

  x, y = infection_human
  # x, yが感染者からユークリッド距離D以内なら感染
  HUMANS.each_with_index do |human, j|
    if Math.sqrt((x - human[0]) ** 2 + (y - human[1]) ** 2) <= D
      infection[j] = "Yes"
      infection_humans << human
      HUMANS.delete_at(j)
    end
  end

  # if HUMANS.any? { |human| Math.sqrt((x - human[0]) ** 2 + (y - human[1]) ** 2) <= D }
  #   infection[i] = "Yes"
  #   infection_humans << infection_human
  #   HUMANS.delete(infection_human)
  # end

  pp infection_humans
end

puts infection
