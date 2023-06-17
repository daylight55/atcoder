#!/usr/bin/env ruby
N = gets.chomp.to_i
MENU = Array.new(N) { gets.chomp.split.map(&:to_i) }

# dp[i][0] : お腹が正常の時の美味しさの合計
# dp[i][1] : お腹を壊している時の美味しさの合計
dp = Array.new(N + 1) { Array.new(2, -Float::INFINITY) }
# 初期値はお腹が正常で美味しさは0
dp[0][0] = 0

MENU.each.with_index do |(x, y), i|
  # 食べる場合
  # NOTE: 毒があるかで死ぬかの瀬戸際なので、合計を加算できる遷移元が変わる
  # 毒がない場合
  if x == 0
    # 正常、腹痛それぞれから今回のメニューを食べることができる
    # かつその合計は遷移元が腹痛の場合も正常のみに記録される
    dp[i + 1][0] = [dp[i][0] + y, dp[i][1] + y].max
  # 毒入りの場合
  else
    # 正常からのみ今回のメニューを食べることができる
    dp[i + 1][1] = dp[i][0] + y
  end

  # 食べない場合もあるので、食べた場合と前の状態を比較して高い方を記録
  dp[i + 1][0] = [dp[i + 1][0], dp[i][0]].max
  dp[i + 1][1] = [dp[i + 1][1], dp[i][1]].max
end

# 最後に正常、腹痛のステータスで高い方を出力
puts dp[N].max
