s = gets.chomp.chars
t = gets.chomp.chars

judge = Array.new(t.length, false)
isBreak = false

(0..s.length).each { |i|
  i_cur = i
  (0..t.length).each { |j|
    if s[i_cur] == t[j]
      judge[j] = true
      i_cur += 1
    else
      judge.map{ |x| x = false}
      break
    end

    if judge.all? {|x| x == true}
      isBreak = true
      break
    end

  }
  break if isBreak
}

result = judge.all? {|x| x == true} ? "Yes" : "No"
puts result
