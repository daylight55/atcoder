#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  s = gets.chomp.split("").map(&:to_i)

  desire = 0
  logo_t_shirt_stock = 0
  muji_t_shirt_stock = m.dup
  dp = Array.new(n, 0)

  while true
    # ロゴ入りTシャツの数を1つずつ増やして確認していく
    desire += 1

    s.each do |i|
      case i
      # なんの予定もない = Tシャツを着用せず、シャツをすべて洗濯する
      when 0
        dp[]

        logo_t_shirt_count = desire
        muji_t_shirt_count = m
      # 食事にいく = ロゴ入りTシャツ または 無地Tシャツを着用する
      when 1
        logo_t_shirt_count += 1
      when 2
        muji_t_shirt_count += 1
      end
    end
  end

  puts desire

end

main
