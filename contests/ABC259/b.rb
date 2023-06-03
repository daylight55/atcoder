#!/usr/bin/env ruby
# require 'matrix'

a, b, d = gets.split(" ").map(&:to_i)
# a, b, d = "-505 191 278".split(" ").map(&:to_i)
theta = d * Math::PI / 180

# rot_m = Matrix[ [Math.cos(theta), -Math.sin(theta)], [Math.sin(theta), Math.cos(theta)] ]
aa = (a * Math.cos(theta) - b * Math.sin(theta))
bb = (a * Math.sin(theta) + b * Math.cos(theta))

puts "#{aa} #{bb}"
