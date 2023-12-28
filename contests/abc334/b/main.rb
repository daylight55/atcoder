a, m, l, r = gets.split.map(&:to_i)

first_tree = (l..Float::INFINITY).bsearch { |x| x >= a && (x - a) % m == 0 }
last_tree = (a..r).bsearch { |x| (x - a) % m == 0 }

puts ((last_tree - first_tree) / m).to_i + 1
