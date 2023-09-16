#!/usr/bin/env ruby
def main
  m = gets.chomp.to_i
  s = Array.new(3) { gets.chomp.split("").map(&:to_i) }

  left_rail = = s[0]
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
  common_nums.each do |num|
    # 共通する文字の座標を全て取得
    right = right_rail.find_indexes(num), middle_rail.find_indexes(num), left_rail.find_indexes(num)

    # スロットを回し始める
    # スロットが回り始めてからt 秒後にi 番目のリールに対応するボタンを押すと、i 番目のリールはSi​の (tmodM)+1 文字目を表示して止まります。
    # この時に、各リールに共通する数字が存在する場合、全て同じ文字に揃えるための最小の秒数を求める
    right.each do |r|
      middle.each do |m|
        left.each do |l|

      end
    end

end

module ArrayExtension
  refine Array do
    def find_indexes(val)
      filter_map.with_index { |element, i| i if element == val }
    end
  end
end

main
