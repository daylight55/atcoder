#!/usr/bin/env ruby
a, b = gets.chomp.split.map(&:to_i)

ans = 0
while a != b
  diff = (a - b).abs
  # aとbの差が大きいときは、aとbの差を一定倍数にすることで、a - bを繰り返す回数を減らすことができる
  if a < b
    subst_num = diff / a
    if subst_num == 0
      ans += 1
      a, b = a, b - a
    else
      ans +=  subst_num
      a, b = a, b - a * subst_num
    end

  elsif a > b
    subst_num = diff / b
    if subst_num == 0
      ans += 1
      a, b = a - b, b
    else
      ans += subst_num
      a, b = a - b * subst_num, b
    end
  end
  # puts "#{a} #{b}"
end

puts ans
