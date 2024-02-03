#!/usr/bin/env ruby
def main
  n, d = gets.split.map(&:to_i)
  a = gets.split.map(&:to_i)

  max_length = 0
  current_length = 1

  for i in 1..(n - 1)
    if (a[i] - a[i - 1]).abs <= d
      current_length += 1
    else
      current_length = 1
    end

    max_length = [max_length, current_length].max
  end

  puts max_length
end

main
