N, M = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)

message = []
re_index = 0
(1..N).each_with_index { |n, i|
  if n == a[re_index]
    message << n
    message << -1 # レ点として-1を挿入
    re_index += 1
  else
    message << n
  end
}

ans = []

def re_check(message, index)
  if message[index + 1] == -1

    if message[index + 3] == -1
      re_check
end
# かつ2つ先にレ点がないか確認しながら進め、これを繰り返す
index = 0
while
  # 1つ先にレ点がある場合は先を読み、
  if message[index + 1] == -1

    if message[index + 3] == -1
  message
end

puts ans.join(' ')
