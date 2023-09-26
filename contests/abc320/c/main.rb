#!/usr/bin/env ruby
def main
  m = gets.chomp.to_i
  s = Array.new(3) { gets.chomp.split("").map(&:to_i) }

  left_rail = s[0]
  middle_rail = s[1]
  right_rail = s[2]

  # まず各レールに共通する数字が存在するか調べる
  judge = false
  common_nums = []
  left_rail.each do |num|
    if middle_rail.include?(num) && right_rail.include?(num)
      judge = true
      common_nums << num
      break
    end
  end
  # 共通する数字が存在しない場合は-1を出力して終了
  unless judge
    puts -1
    return
  end

  # 共通する文字の座標に揃えられるか調べる
  all_times = []
  common_nums.each do |num|
    # 共通する文字の座標を全て取得
    right = right_rail.find_indexes(num)

    # スロットを回し始める
    # スロットが回り始めてからt 秒後にi 番目のリールに対応するボタンを押すと、i 番目のリールはSi​の (tmodM)+1 文字目を表示して止まります。
    # この時に、各リールに共通する数字が存在する場合、全て同じ文字に揃えるための最小の秒数を求める
    right.each do |r|
      # rに止めるまでに回転している
      middle_rail.rotate!(r)
      left_rail.rotate!(r)
      # 先のインデックスで共通する文字の座標を取得
      middle = middle_rail.find_indexes(num).reject { |i| i < r }
      # 真ん中を止めるのにかかった秒数
      middle_time = middle - r
      # その分回転
      left_rail.rotate!(middle_time)
      # 左のインデックスで共通する文字の座標を取得
      left = left_rail.find_indexes(num).reject { |i| i < middle_time }
      # 左を止めるのにかかった秒数
      left_time = left - middle_time

      # 全ての時間を足し合わせる
      all_times << r + middle_time + left_time
    end
  end

  # 最小の秒数を出力
  puts all_times.min
end

module ArrayExtension
  refine Array do
    def find_indexes(val)
      filter_map.with_index { |element, i| i if element == val }
    end
  end
end
using(ArrayExtension)

main
