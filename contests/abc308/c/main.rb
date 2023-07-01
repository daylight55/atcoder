#!/usr/bin/env ruby
require  'bigdecimal'

def main
  n = gets.chomp.to_i
  coins = Array.new(n) { gets.chomp.split.map(&:to_i) }
  table = Hash.new { |h, k| h[k] = [] }

  coins.each_with_index do |coin, i|
    a = coin[0]
    b = coin[1]
    success_rate = BigDecimal(a) / (BigDecimal(a) + BigDecimal(b))
    table[success_rate] << i
  end

  result = []
  table.keys.sort.each do |key|
    table[key].sort.reverse.each do |i|
      result << i + 1
    end
  end

  puts result.reverse.join(' ')
end

main
