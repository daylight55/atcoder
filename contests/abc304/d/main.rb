#!/usr/bin/env ruby
W, H = gets.chomp.split.map(&:to_i)
N = gets.chomp.to_i
STRAWBERRIES = Array.new(N) { gets.chomp.split.map(&:to_i) }
A = gets.chomp.to_i
CUTS_HORIZONTAL = gets.chomp.split.map(&:to_i)
B = gets.chomp.to_i
CUTS_VERTICAL = gets.chomp.split.map(&:to_i)

def cut_strawberries(strawberries, cuts)
  cuts.each do |cut|
    strawberries = strawberries.map do |strawberry|
      if strawberry[0] < cut
        [strawberry[0], strawberry[1], cut, strawberry[3]]
      else
        [cut, strawberry[1], strawberry[2], strawberry[3]]
      end
    end
  end
  strawberries
end

def count_strawberries(strawberries)
  strawberries.map { |strawberry| (strawberry[2] - strawberry[0]) * (strawberry[3] - strawberry[1]) }.inject(:+)
end

strawberries = cut_strawberries(STRAWBERRIES, CUTS_HORIZONTAL)
strawberries = cut_strawberries(strawberries, CUTS_VERTICAL)
puts count_strawberries(strawberries)
