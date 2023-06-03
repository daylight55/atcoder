#!/usr/bin/env ruby
S = gets.chomp.chars
ans = 0
S.tally.each{ |k, v|
  # 各文字の出現回数のカウントから文字を並び替えることによって同じ列を2度繰り返すようにできる文字列の個数を求める
  # 例えば、'aabb'の場合、'abab'と'aabb'の2通り
  # この場合、'aabb'の文字列の個数は、'a'が2個、'b'が2個あるので、2 * 2 = 4通り
  def combination(n, r)
    return 1 if r == 0
    return n if r == 1
    return combination(n, n - r) if r > n / 2
    (n - r + 1..n).inject(:*) / (1..r).inject(:*)
  end
  ans += combination(v, 2)
}

puts ans
