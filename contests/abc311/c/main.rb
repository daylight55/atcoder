#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)

  graph = Array.new(n)
  (0...n-1).each{|i|
    graph[i] = a[i - 1]
  }

  uf = UnionFind.new(n)

  # 有効閉路をノード一覧例を出力
  m = uf.groups[1].size
  # Bi+1 = ABi となるように、B1, B2, ..., BN を出力
  ans = []
  ans << node[uf.groups[1][m - 1]]
  ans << uf.groups[1][0...-2].each{ |nd|
    ans << node[nd]
  }

  puts m
  puts ans.join(" ")
end

# ---------------------------------------------------
# ref. https://github.com/universato/ac-library-rb/blob/main/lib/dsu.rb
class DSU
  def initialize(n = 0)
    @n = n
    @parent_or_size = Array.new(n, -1)
    # root node: -1 * component size
    # otherwise: parent
  end

  attr_reader :parent_or_size, :n

  def merge(a, b)
    x = leader(a)
    y = leader(b)
    return x if x == y

    x, y = y, x if -@parent_or_size[x] < -@parent_or_size[y]
    @parent_or_size[x] += @parent_or_size[y]
    @parent_or_size[y] = x
  end
  alias unite merge

  def same?(a, b)
    leader(a) == leader(b)
  end
  alias same same?

  def leader(a)
    unless 0 <= a && a < @n
      raise ArgumentError.new, "#{a} is out of range (0...#{@n})"
    end

    @parent_or_size[a] < 0 ? a : (@parent_or_size[a] = leader(@parent_or_size[a]))
  end
  alias root leader
  alias find leader

  def [](a)
    if @n <= a
      @parent_or_size.concat([-1] * (a - @n + 1))
      @n = @parent_or_size.size
    end

    @parent_or_size[a] < 0 ? a : (@parent_or_size[a] = self[@parent_or_size[a]])
  end

  def size(a)
    -@parent_or_size[leader(a)]
  end

  def groups
    (0 ... @parent_or_size.size).group_by{ |i| leader(i) }.values
  end

  def to_s
    "<#{self.class}: @n=#{@n}, #{@parent_or_size}>"
  end
end
UnionFind = DSU

main
