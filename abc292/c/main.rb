#!/usr/bin/env ruby
require 'prime'
# ref. https://qiita.com/HMMNRST/items/756460a3ebf13b96278e
class Prime
    def each_divisor(n, &block)
        pf = prime_division(n)
        num = -> { pf.inject(1) { |prod, (_, exp)| prod * exp.succ } }
        Enumerator.new(num) { |y| __each_divisor__(1, pf, &y.method(:<<)) }
                  .tap { |enum| enum.each(&block) }
    end

    private def __each_divisor__(d, ary, &block)
        return yield(d) if ary.empty?

        ary = ary.dup
        prime, exp = ary.pop
        0.upto(exp) { __each_divisor__(d, ary, &block); d *= prime }
    end
end
prime = Prime.instance

n = gets.chomp.to_i
count = 0

(1..Math.sqrt(n)).each{ |i|
  # ABとCDの組み合わせは対応するから半分だけ求めたら倍にすればいい。
  # Nを表現できる和の組み合わせを考える
  # その後、各数字を素因数分解し、その素因数の組み合わせを考える

  # まずABを決める
  ab = i
  # abの約数の数を求める
  ab_divisor_size = prime.each_divisor(ab).size
  puts "i:#{i} ab_factors:#{ab_divisor_size}"

  # それぞれの数を求める
  cd = n - i

  prime.each_divisor(cd) { |c|
    puts "ab: #{ab} cd: #{cd} c:#{c}"

    d = cd / c
    a = ab / d
    puts "a:#{a} b:#{b} c:#{c} d:#{d}"
    b = ab / a

    if a == b and c == d
      # AB,CDを入れ替えた2通り
      count += 2
    elsif a == b or c != d
      # AB固定のC,D入れ替え、またその逆の4通り
      count += 4
    elsif a != b and c == d
      # 直上と同様
      count += 4
    elsif a!= b and c != d
      # 全て入れ替え可能なため8通り
      count += 8
    end


  }

  # cdの約数の数を求める
  cd_divisor_size = prime.each_divisor(cd).size
  puts "i:#{i} cd_factors:#{cd_divisor_size}"

  # 個数を掛け算する
  if i * i == n
    count += 2
  else
    count += ab_divisor_size * cd_divisor_size
  end
  # puts "count #{count}"
}

puts count * 2
