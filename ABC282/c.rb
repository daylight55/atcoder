class Array
  # 特定の条件のインデックスを全て返す
  def select_indice &p; map.with_index{|x, i| i if p.call(x)}.compact end
end
#---------------------------------

# N = gets.chomp.to_i
# S = gets.chomp

N = 20
S = 'a,"t,"c,"o,"d,"e,"r,'

A = S.split('"')

# やり方1
# "のインデックス一覧をとって、範囲に入ってなければ変換

# quoto_indexes = []
# quoto_indexes = S.select_indice{|x| x == '"'}
# puts quoto_indexes.join(" ")


# quoto_num = quoto_indexes.length

R = Array.new(N)
A.each_with_index{ |a, i|
  A[i] == a.gsub() if i % 2 != 0
}
