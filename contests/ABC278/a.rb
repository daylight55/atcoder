n, k = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)

k.times {
  a.shift
  a.append(0)
}

puts a.join(" ")
