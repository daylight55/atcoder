#!/bin/env/ruby

x,y,z = gets.split.map(&:to_i)

if x > 0
  if y > 0
    if x > y
      if z > y
        result = -1
      else
        if z < 0
          result = z.abs * 2 + x
        else
          result = x
        end
      end
    else
      result = x
    end
  else
    result = x
  end
else
  if y < 0
    if x < y
      if z < y
        result = -1
      else
        if z > 0
          result = z * 2 + x.abs
        else
          result = x.abs
        end
      end
    else
      result = x.abs
    end
  else
    result = x.abs
  end
end

puts result
