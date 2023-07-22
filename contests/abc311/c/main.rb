#!/usr/bin/env ruby
def main
  n = gets.chomp.to_i
  a = gets.chomp.split.map(&:to_i)

  graph = Array.new(n)
  (0..n-1).each{|i|
    graph[i] = a[i - 1]
  }

  uf = UnionFind.new(n + 1)

  cycle = []
  (0..n-1).each{|i|
    if uf.same?(i, graph[i])
      cycle_start = i
      cycle_end = graph[i]
      break
    else
      uf.merge(i, graph[i])
    end
  }

  unless cycle_start.nil?
    current = cycle_start
    while current != cycle_end
      cycle << current
      current = graph[current]
    end
  end

  puts cycle.size
  puts cycle.join(" ")

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
