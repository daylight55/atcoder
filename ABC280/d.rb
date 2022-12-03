require 'prime'

# 与えられた整数 K
k = gets.chomp.to_i

# K を素因数分解する
factors = k.prime_division

# K の倍数となる整数 N の最小値を求める
n = factors.map { |f| f[0] }.max

# 答えとなる整数 N を出力する
puts n
