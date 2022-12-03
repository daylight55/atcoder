H, W = gets.chomp.split.map(&:to_i)
S = Array.new(H){ gets.chomp.chars }

puts S.flatten.count("#")
