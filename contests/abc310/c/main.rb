#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  s = Array.new(n) { gets.chomp.chars }

  # ボールをユニークにする
  s_set = Set.new(s)
  # 削除した文字を記録する
  deleted = Set.new

  # 自身以外で回文のボールが存在したら削除
  s.each_with_index do |ball, i|
    # 一文字か同じ文字のみの場合は除外
    next if ball.size == 1 || ball.uniq.size == 1
    # 既に自身のペアとなる回文を削除していたら次へ
    next if deleted.include?(ball.reverse)

    # 回文を削除
    s_set.delete(ball.reverse)
    deleted.add(ball)
  end

  puts s_set.size
end

require 'set'
main
