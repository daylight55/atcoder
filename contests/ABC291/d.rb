N = gets.chomp.to_i
cards = []
N.times {
  cards << gets.chomp.split.map(&:to_i)
}

# カードは[0]が表、[1]が裏
# 任意のカードを裏返して次のカードの表が一致しないようにした時の場合の数を求める

# 裏返すカードの枚数を変化させながら、裏返すカードの組み合わせを動的計画法で求める
def solve(cards)
  # 1枚目のカードの裏を裏返す場合
  # 2枚目のカードの表が1枚目のカードの裏と一致しない場合の数
  dp = Array.new(N + 1) { Array.new(2, 0) }
  dp[1][0] = cards[0][0] == cards[0][1] ? 1 : 2
  dp[1][1] = cards[1][0] == cards[0][1] ? 1 : 2

  (2..N).each do |i|
    # 1枚目のカードの裏を裏返さない場合
    # 2枚目のカードの表が1枚目のカードの表と一致しない場合の数
    dp[i][0] = dp[i - 1][0] * (cards[i - 1][0] == cards[i - 2][0] ? 1 : 2)
    dp[i][0] += dp[i - 1][1] * (cards[i - 1][0] == cards[i - 2][1] ? 1 : 2)

    # 1枚目のカードの裏を裏返す場合
    # 2枚目のカードの表が1枚目のカードの裏と一致しない場合の数
    dp[i][1] = dp[i - 1][0] * (cards[i - 1][1] == cards[i - 2][0] ? 1 : 2)
    dp[i][1] += dp[i - 1][1] * (cards[i - 1][1] == cards[i - 2][1] ? 1 : 2)
  end

  dp[N][0] + dp[N][1]
end

puts solve(cards)
