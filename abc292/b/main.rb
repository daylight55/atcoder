#!/usr/bin/env ruby
n,q = gets.chomp.split.map(&:to_i)
events = Array.new(q){gets.chomp.split.map(&:to_i)}
senshu = Array.new(n,0)

events.each{ |event|
  if event[0] == 1
    senshu[event[1]-1] += 1
  elsif event[0] == 2
    senshu[event[1]-1] += 2
  elsif event[0] == 3
    if senshu[event[1]-1] >= 2
      puts "Yes"
    else
      puts "No"
    end
  end
}
