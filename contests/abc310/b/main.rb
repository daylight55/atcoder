#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  input = Array.new(n) { gets.chomp.split.map(&:to_i) }

  result = false
  n.times do |i|
    # targetの製品
    p, c = input[i][0], input[i][1]
    f = input[i][2..-1]

    n.times do |j|
      j_p, j_c = input[j][0], input[j][1]
      j_f = input[j][2..-1]

      # 価格がtarget以下か
      if j_p <= p
        # ターゲットの持つ機能を全て持っているか
        if j_f.all?{|y| f.include?(y)}
          # 機能数がターゲット以上か
          if j_c >= c
          # 価格がターゲット未満もしくは、ターゲットにない機能を持っているか
            if j_p < p || j_f.any?{|y| !f.include?(y)}
              result = true
              break
            end
          end
        end
      end
    end
  end

  puts result ? 'Yes' : 'No'
end

# ---------------------------------------------------
# 以下、自前ライブラリ
class Array
  # ref. https://stackoverflow.com/questions/1475808/cumulative-array-sum-in-ruby
  def cumulative_sum
    sum = 0
    self.map{|x| sum += x}.unshift(0) # 頭に0を追加しておく
  end
end

main
