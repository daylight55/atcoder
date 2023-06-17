#!/usr/bin/env ruby
N = gets.chomp.to_i
MENU = Array.new(N) { gets.chomp.split.map(&:to_i) }

# 高橋君のお腹の状態を個別にもつ
# dp[i][0]: お腹を壊している時の美味しさの最大値
# dp[i][1]: お腹を壊していない時の美味しさの最大値
dp = Array.new(N) { Array.new(2, Float::INFINITY) }

# 高橋君はメニューを食べるか食べないかを選べる
# yが美味しさで、美味しさの合計を最大化したい
MENU.each.with_index do |(x, y), i|
  # x = 0: 毒入りでこの時お腹を壊す。またすでにお腹を壊している場合は死ぬ。
  # x = 1: 解毒剤入りでことの時お腹を壊していた場合は治る。お腹を壊していない場合は何も起こらない。
  stomachache = false

  if x == 0
    stomachache = true
    dp[i][0] = [dp[i][0], y].max
  elsif x == 1 && dp[i][0] == Float::INFINITY
    stomachache = false
  end
