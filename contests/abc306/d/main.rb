#!/usr/bin/env ruby
def max_deliciousness(n, menu)
  max_sum = 0

  (1..(2**n - 1)).each do |mask|
    sum = 0
    stomachache = false

    (0...n).each do |i|
      xi, yi = menu[i]

      if (mask & (1 << i)) > 0
        if xi == 0 && !stomachache
          sum += yi
        elsif xi == 1
          stomachache = true
          break
        end
      end
    end

    max_sum = [max_sum, sum].max unless stomachache
  end

  return max_sum
end

# 以下は実行例です

n = gets.chomp.to_i
menu = Array.new(n) { gets.chomp.split.map(&:to_i) }

result = max_deliciousness(n, menu)
puts result
