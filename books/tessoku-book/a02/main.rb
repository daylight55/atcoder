#!/usr/bin/env ruby
N, X = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

A.include?(X) ? puts("Yes") : puts("No")
