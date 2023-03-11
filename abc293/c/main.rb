#!/usr/bin/env ruby
H, W = gets.chomp.split.map{|i| i.to_i}
table = Array.new(H){gets.chomp.split.map{|i| i.to_i}}

dp = Array.new(H){Array.new(W, 0)}
dp[0][0] = 1

(0...H).each { |i|
  (0...W).each { |j|
    # 原点はスキップ
    next if (i == 0) && (j == 0)

    way_right = 0
    way_down = 0

    # 右を確認
    if table[i][j] != table[i][j-1]
      way_right = dp[i][j-1]
    end

    # 下を確認
    if table[i][j] != table[i-1][j]
      way_down = dp[i-1][j]
    end

    dp[i][j] = way_right + way_down
  }
}

dp.each{|i| p i}
puts dp[H-1][W-1]
