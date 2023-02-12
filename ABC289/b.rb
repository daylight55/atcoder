N, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

array = (1..N).slice_after{|i| !A.include?(i)}
puts array.to_a.map{ |x| x.reverse}.flatten.join(" ")
