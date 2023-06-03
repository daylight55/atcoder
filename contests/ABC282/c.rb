N = gets.chomp.to_i
S = gets.chomp

in_quoto = false
result = ""

S.each_char { |c|
  if c == '"'
    in_quoto = !in_quoto
    result << c
  elsif c == ','
    result << (in_quoto ? ',' : '.')
  else
    result << c
  end
}

puts result
