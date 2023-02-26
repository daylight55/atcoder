N = gets.chomp.to_i
X = gets.chomp.split.map(&:to_i)

# Xをソートして先頭からNこの要素の削除と末尾からN個の要素の削除を繰り返す
# これでXの中央値が求められる
def median(x, n)
  x.sort!
  n.times do
    x.shift
    x.pop
  end
  x
end

list = median(X, N)
puts list.sum / list.length.to_f
