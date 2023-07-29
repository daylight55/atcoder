#!/usr/bin/env ruby
def main
  s = gets.chomp
  ans = ["ACE", "BDF", "CEG", "DFA", "EGB", "FAC", "GBD"]
  puts ans.include?(s) ? "Yes" : "No"
end

main
