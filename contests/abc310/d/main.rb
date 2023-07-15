#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  s = Array.new(n) { gets.chomp.chars }

  # ボールをユニークにする
  s_set = Set.new(s)

  # 自身以外で回文のボールが存在したら削除
  s.each_with_index do |ball, i|
    # 一文字か同じ文字のみの場合は除外
    next if ball.size == 1 || ball.uniq.size == 1
    s_set.delete(ball.reverse)
  end

  puts s_set.size
end


require 'set'
main
