#!/bin/env ruby

A, B = gets.chomp.split.map(&:to_i)

s = (B.to_f / A).round(3)

puts sprintf("%.3f", s)
