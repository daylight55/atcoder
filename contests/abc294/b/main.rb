H, W = gets.chomp.split.map(&:to_i)
A = Array.new(H) { gets.chomp.split.map(&:to_i) }

offset = 'A'.ord - 1
A.each{|a|
  row = []
  a.each{|i|
    if i == 0
      row << '.'
    else
      row << (i + offset).chr
    end
  }
  puts row.join('')
}
