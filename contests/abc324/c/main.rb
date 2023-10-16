#!/usr/bin/env ruby
def main
  input = gets.chomp.split
  n = input[0].to_i
  t = input[1].chars
  s = Array.new(n){ gets.chomp.chars }

  ans = []
  t_comp = t.sort.slice_when{ |e, c| e != c }.map{ |e| [e[0], e.size] }

  s.each_with_index do |si, i|
    si_comp = si.sort.slice_when{ |e, c| e != c }.map{ |e| [e[0], e.size] }

    if si_comp.size != t_comp.size
      # サイズが異なる場合の処理
      zipped = si_comp.zip(t_comp)
      missmatch_chars = zipped.select{ |a, b| a != b }.map{ |a, b| a[0] }
      if missmatch_chars.size == 1
        # 差が1であるかの判定
        if (si_comp.find{ |x| x[0] == missmatch_chars[0] }[1] - t_comp.find{ |x| x[0] == missmatch_chars[0] }[1]).abs == 1
          ans << i
        end
      end
    else
      # サイズが等しい場合の処理
      ans << i if si == t
      diff = si_comp - t_comp
      ans << i if diff.size == 1
    end
  end

  puts ans.size
  puts ans.sort.map{ |i| i + 1 }.join(" ")
end

main
