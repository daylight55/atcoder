#!/usr/bin/env ruby
N = gets.chomp.to_i
W = gets.chomp.split

if W.include?('and') || W.include?('not') || W.include?('that') || W.include?('the') || W.include?('you')
  puts 'Yes'
else
  puts 'No'
end
