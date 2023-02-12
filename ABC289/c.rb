"""
  bit全探索により、選択方法の対応を取る。

  Rubyにおけるシフト演算子とIntegerの配列参照については以下を参照。
  ref.
    - [Integer#<< (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Integer/i/=3c=3c.html)
    - [Integer#[] (Ruby 3.2 リファレンスマニュアル)](https://docs.ruby-lang.org/ja/latest/method/Integer/i/=5b=5d.html)
    - [Rubyで競技プログラミング bit演算の基礎まとめ - ls /asapon/blog](https://asapon.hateblo.jp/entry/2020/07/14/230746)

  bitの各桁がS1,S2,...,Snの集合の選択に対応する。
  1が立つ場合に選択、0の場合に未選択として扱う。
  Sの選び方を全パターン取り(カバレッジ100%)、それぞれのケースで用件を満たす数を確認する。
  計算量は各回のN回の処理、M回の精査を乗じて O(2^M * N * M) となる。
"""
require 'set'

N, M = gets.split.map(&:to_i)
a = []
M.times{
  c = gets.chomp.to_i
  a << gets.split.map(&:to_i)
}

ans = 0
(1 << M).times { |b|
  # 選択した集合を記録する
  t = Set.new
  M.times { |i|

    # 今のiの2進数表記確認方法
    # printf("%0#{M}b\n", b)

    # 今回のbit配列において0の桁、つまり未選択の集合を追加する。
    a[i].each { |x| t.add(x) } if b[i].zero?
  }
  # 集合の大きさがNに一致する時、つまり1以上N以下の全てのxを含む時にカウントを加算する。
  ans += 1 if t.size == N
}
puts ans
