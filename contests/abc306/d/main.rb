#!/usr/bin/env ruby
N = gets.chomp.to_i
MENU = Array.new(N) { gets.chomp.split.map(&:to_i) }

# dp[i][0] : お腹が正常
# dp[i][1] : お腹を壊している
dp = Array.new(N + 1) { Array.new(2, -Float::INFINITY) }
# 初期値はお腹が正常で美味しさは0
dp[0][0] = 0

MENU.each.with_index do |(x, y), i|
  # 食べる場合
  # NOTE: 毒があるかで死ぬかの瀬戸際なので遷移の条件が変わる
  # 毒がない場合
  if x == 0
    # 正常、腹痛それぞれから今回のメニューを食べることができる
    dp[i + 1][0] = [dp[i][0], dp[i][0] + y].max
  # 毒入りの場合
  else
    # 正常からのみ今回のメニューを食べることができる
    dp[i + 1][1] = [dp[i][1], dp[i][0] + y].max
  end

  # 食べない場合もあるので、食べた場合と前の状態を比較して高い方を記録
  dp[i + 1][0] = [dp[i + 1][0], dp[i][0]].max
  dp[i + 1][1] = [dp[i + 1][1], dp[i][1]].max
end

puts dp[N].max
