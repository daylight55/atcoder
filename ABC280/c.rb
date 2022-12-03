S = gets.chomp
T = gets.chomp

s = S.chars.tally
t = T.chars.tally
diff = t.to_a - s.to_a

# substr_list_s = S.scan(Regexp.new("#{diff[0][0]}+")).sort
# substr_list_t = T.scan(Regexp.new("#{diff[0][0]}+")).sort

# diff_substr = ""
# substr_list_s.each_with_index{ | substr_s, i |

#   p "#{substr_s} #{substr_list_t[i]}"
#   if substr_s != substr_list_t[i]
#     p "ok"
#     diff_substr = substr_s
#     break
#   end
# }

def scan_str(str, pattern)
  res = []
  (0..str.length).each do |i|
    res << [Regexp.last_match.to_s, i] if str[i..-1] =~ /^#{pattern}/
  end
  res
end

# puts T.index(diff_substr) + 1

substr_list_s = scan_str(S, Regexp.new("#{diff[0][0]}")).sort
substr_list_t = scan_str(T, Regexp.new("#{diff[0][0]}")).sort

diff = substr_list_t - substr_list_s

puts diff[0][1] + 1

# pp substr_list_s
# pp substr_list_t

# substr_list_s.each_with_index{ | substr_s, i |

#   p "#{substr_s} #{substr_list_t[i]}"
#   if substr_s != substr_list_t[i]
#     p "ok"
#     diff_substr = substr_s
#     break
#   end
# }



#------------------------------------------------------#



# puts T.find_index{ |t| t == diff[0][0] } + 1

# S.each_with_index { |s, i|
#   if s == T[i]
#     next
#   else
#     diff_index = i
#     break
#   end
# }

# puts diff_index
