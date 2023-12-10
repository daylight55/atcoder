#!/usr/bin/env ruby
def main
  n, m = gets.chomp.split.map(&:to_i)
  s = gets.chomp.chars.map(&:to_i)

  ans = 0
  x, y = 0, 0
  s << 0

  s.each_with_index do |c, i|
    case c

    # なんの予定もない = Tシャツを着用せず、シャツをすべて洗濯する
    when 0
      ans = [ans, [x + y -m, y].max].max
      x, y = 0, 0
    # 食事にいく = ロゴ入りTシャツ または 無地Tシャツを着用する
    when 1
      x += 1
    # 競技プログラミングのイベントに行く = ロゴ入りのTシャツ1枚を着用する
    when 2
      y += 1
    end
  end
  puts ans

end

main
