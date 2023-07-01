#!/usr/bin/env ruby
S = gets.chomp.split.map(&:to_i)
before = S[0]
result = true

S.each_with_index do |s, i|
  if s >= before and 100 <= s and s <= 675 and (s % 25) == 0
    result = true
  else
    result = false
    break
  end
  before = s
end

puts result ? 'Yes' : 'No'
