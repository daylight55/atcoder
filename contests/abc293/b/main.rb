#!/usr/bin/env ruby
module ArrayExtension
  refine Array do
    def find_indexes(val)
      filter_map.with_index { |element, i| i if element == val }

      # Ruby 2.7 未満の場合は Enumerable#filter_map がないので他の書き方で。
      # map.with_index { |element, i| i if element == val }.compact
    end
  end
end

using(ArrayExtension)

n = gets.chomp.to_i
A = gets.chomp.split(" ").map(&:to_i)

called = Array.new(n, false)
A.each_with_index{ |a, i|
  unless called[i]
    called[a - 1] = true
  end
  # pp called
}

ans = called.find_indexes(false)
puts ans.length
puts ans.map{ |i| i + 1 }.join(" ")
