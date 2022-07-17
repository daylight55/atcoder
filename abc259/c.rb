#!/usr/bin/env ruby

S = gets
T = gets
judge = "No"

s_blocks = []
series_blocks = []

for chr in S.chars
  if chr == prev_chr
    s_blocks.push(chr)
  prev_chr = chr
end

puts judge
