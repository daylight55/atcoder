require 'set'

N, M = gets.split.map(&:to_i)
a = []
M.times{
  c = gets.chomp.to_i
  a << gets.split.map(&:to_i)
}

ans = 0
# bit全探索により、選択方法の全ての選び方を対応取る
# bitの各桁がS1,S2,...,Snの集合の選択に対応する。
# 1が立つ場合に選択、0の場合に未選択として扱う。
(1 << M).times { |b|
  # 選択した集合を記録する
  t = Set.new
  M.times { |i|
    # 2進数表記で0の場合、つまり未選択の場合集合に追加する
    a[i].each { |x| t.add(x) } if b[i].zero?
  }
  # 集合の大きさがNに一致する時、つまり1以上N以下の全てのxを含む時にカウントする
  ans += 1 if t.size == N
}
puts ans
