#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  s = gets.chomp.chars.map(&:to_i)

  desire = 1
  logo_t_shirt_stock = 0
  muji_t_shirt_stock = m.dup

  while true
    s.each_with_index do |c, i|
      case c
      # なんの予定もない = Tシャツを着用せず、シャツをすべて洗濯する
      when 0
        logo_t_shirt_stock = desire
        muji_t_shirt_stock = m
      # 食事にいく = ロゴ入りTシャツ または 無地Tシャツを着用する
      when 1
        # シャツがない場合はループを抜ける
        break if logo_t_shirt_stock == 0 && muji_t_shirt_stock == 0
        # 無地Tシャツがない場合は、ロゴ入りTシャツを着用する
        if muji_t_shirt_stock == 0 && logo_t_shirt_stock > 0
          logo_t_shirt_stock -= 1
          next
        # 無地Tシャツがある場合は、無地Tシャツを着用する
        else
          muji_t_shirt_stock -= 1
        end
      # 競技プログラミングのイベントに行く = ロゴ入りのTシャツ1枚を着用する
      when 2
        # シャツがない場合はループを抜ける
        break if logo_t_shirt_stock == 0
        # ロゴ入りTシャツを着用する
        logo_t_shirt_stock -= 1
      end
      # sをすべて処理できた場合は、ループを抜ける
      break if i == s.size - 1
    end

    # ロゴ入りTシャツの数を1つずつ増やして確認していく
    desire += 1
  end

  puts desire

end

main
