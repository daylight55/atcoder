S = gets.chomp

ans = []
S.chars.each{ |s|
  ans << '0' if s == '1'
  ans << '1' if s == '0'
}
puts ans.join('')
