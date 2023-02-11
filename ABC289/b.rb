N, M = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)

message = ''
re_index = 0
(1..N).each_with_index { |n, i|
  if n == a[re_index]
    message = message + n.to_s
    message = message + 'レ'
    re_index += 1
  else
    message = message + n.to_s
  end
}

message_groups = message.split(/レ/)
# puts message.split(/レ/)

ans = Array.new(message_groups.length, Array.new())
next_group = []
message_groups.length.times{ |i|
  # 1個ならレ点で繋がっているため素直に追加
  if message_groups[i].length == 1
    ans << message_groups[i]
  # 複数個であればレ点の終わりを示す
  else
    # 初めは繋がっていたため追加
    ans << message_groups[i].first
    next_group
  end
}
