n, k = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

def mex(set)
  m = -1
  # 0を含んでいない場合、0を返す
  return 0 if !array.include?(0)

  # 0を含んでいる場合、順番に探す
  (array.max + 1).times{ |i|
    if !array.include?(i)
      m = i
      break
    end
  }
  # 更新できなかった場合は最大値と一致しているため最大値 + 1を返す
  m = array.max + 1 if m == -1
  return m
end

mex_list = []
A.combination(k).to_a.uniq.each{ |c|
  c_set = c.to_set
  m = mex(c_set)
  # puts "c_set: #{c_set.join(' ')} \n m: #{m}"
  mex_list << m
}

puts mex_list.max
