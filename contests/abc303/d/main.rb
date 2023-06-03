#!/usr/bin/env ruby
X, Y, Z = gets.chomp.split.map(&:to_i)
S = gets.chomp.chars

# dp[i][0]: 手前の文字を入力してCapslockがOFFの状態になっているときの最小コスト
# dp[i][1]: 手前の文字を入力してCapslockがONの状態になっているときの最小コスト
dp = Array.new(S.size + 1){ Array.new(2, Float::INFINITY ) }
# 初期状態はOFF
dp[0][0] = 0

S.size.times do |i|
  # Capslockを押して入れ替える。常に最小コストを保つため、逆の状態に対して押さない方が小さいならそれも維持。
  dp[i][0] = [dp[i][0], dp[i][1] + Z].min
  dp[i][1] = [dp[i][1], dp[i][0] + Z].min

  # 大文字入力
  if S[i] == 'a'
    dp[i + 1][0] = [dp[i + 1][0], dp[i][0] + X].min # CapslockがOFFの場合
    dp[i + 1][1] = [dp[i + 1][1], dp[i][1] + Y].min # CapslockがONの場合
  # 小文字入力
  else
    dp[i + 1][0] = [dp[i + 1][0], dp[i][0] + Y].min # CapslockがOFFの場合
    dp[i + 1][1] = [dp[i + 1][1], dp[i][1] + X].min # CapslockがONの場合
  end
end

# 最終結果が低い方を出力
puts [dp[S.size][0], dp[S.size][1]].min
