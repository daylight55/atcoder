require 'set'

N, M = gets.chomp.split.map(&:to_i)
S = Array.new(N){ gets.chomp }
T = Array.new(M){ gets.chomp }

s_tail3_array = S.map{ |s| s.slice(-3, 3)}
t_set = Set[*T]
# s_tail3_set = Set[*s_tail3_array]

count = 0
s_tail3_array.each{ |s|
  count += 1 if t_set.include?(s)
}

puts count
