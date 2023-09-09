#!/usr/bin/env ruby
def main
  s = gets.chomp.chars

  # ランレングス圧縮
  grouped = s.chars.slice_when{ |e, c| e != c }.map{ |e| [e[0].to_i, e.size] }

  
end

main
