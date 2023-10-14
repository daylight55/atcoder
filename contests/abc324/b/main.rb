#!/usr/bin/env ruby
require 'prime'

def main
  n = gets.chomp.to_i

  # (1..50).each do |i|
  #   if n % (2 ** i) == 0
  #     puts("Yes")
  #     return
  #   end
  # end
  # puts("No")

  factors = Prime.prime_division(n)

  if factors.count == 1 && (factors[0][0] == 2 || factors[0][0] == 3)
    puts("Yes")
    return
  end

  if factors.count == 2 && factors[0][0] == 2 && factors[1][0] == 3
    puts("Yes")
    return
  end

  puts("No")
end

main
