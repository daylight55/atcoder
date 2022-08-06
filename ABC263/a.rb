#!/usr/bin/env ruby

cards = gets.chomp.split(" ").map(&:to_i)
unless cards.uniq.length == 2
  puts "No"
  exit
end

result = {}
cards.uniq.each { |card|
  result[card] = cards.count(card)
}
if result.values.sort == [2, 3]
  puts "Yes"
else
  puts "No"
end
