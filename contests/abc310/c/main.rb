#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  s = Array.new(n) { gets.chomp.chars }

  count = 0
  s.each_with_index do |ball|
    # 自身を除いた配列
    s.delete_at(i)
    # 同じボールがあればカウントアップし取り出して次へ
    if s.include?(ball)
      count += 1
      s.delete(ball)
      next
    end
    # 回文のものがあれば取り出して次へ
    if s.include?(ball.reverse)
      count += 1
      s.delete(ball.reverse)
      next
    end
  end

  puts count
end

main
