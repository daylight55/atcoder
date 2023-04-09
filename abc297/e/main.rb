#!/usr/bin/env ruby
N, K = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

multiple = 0
list = A.sort!
result = list.dup

while list.length < K
  multiple += 1
  list.each { |a1|
    list.each{ |a2|
      result << (a1 * multiple) + (a2 * multiple)
    }
  }
  list = result.dup.uniq!.sort!
  # puts "list: #{list}"
end

puts result[K - 1]
