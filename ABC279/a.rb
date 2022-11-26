s = gets.chomp
result = 0

s.chars.each{ |c|
  if c == "v"
    result += 1
  elsif c == "w"
    result += 2
  end
}

puts result
