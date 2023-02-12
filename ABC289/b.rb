N, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

"""
レ点の入る位置をグループ分けの基準とする。レ点対象でない数字で連結成分が切れるため、そこまでを末尾に含めてグループ化する。また区切り要素は末尾に含める。
例)
N=5, M=5, A=[1, 3, 4]の時
i=1 レ点対象に含まれるため区切りではない。
i=2 レ点対象でないため、ここまでをグループとする。
i=3 レ点対象に含まれるため区切りではない。
i=4 レ点対象に含まれるため区切りではない。
i=5 レ点対象でないため、ここまでをグループとする。
ref. https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/slice_after.html
"""
array = (1..N).slice_after{|i| !A.include?(i)}

"""
後は各グループを逆順に読み結合すれば解となる。
"""
puts array.to_a.map{ |x| x.reverse}.flatten.join(" ")
