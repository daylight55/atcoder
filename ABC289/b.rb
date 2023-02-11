# ref. https://qiita.com/k_karen/items/5349a25c3eb7b4697f58
class UnionFind
  attr_accessor :parent

  def initialize(size)
    @rank = Array.new(size, -1)
    @parent = Array.new(size, &:itself)
  end

  def merge(id_x, id_y)
    x_parent = get_parent(id_x)
    y_parent = get_parent(id_y)
    return if x_parent == y_parent

    if @rank[x_parent] > @rank[y_parent]
      @parent[y_parent] = x_parent
    else
      @parent[x_parent] = y_parent
      @rank[y_parent] += 1 if @rank[x_parent] == @rank[y_parent]
    end
  end

  def get_parent(id_x)
    @parent[id_x] == id_x ? id_x : (@parent[id_x] = get_parent(@parent[id_x]))
  end

  def same_parent?(id_x, id_y)
    get_parent(id_x) == get_parent(id_y)
  end

  def size
    @parent.map { |id_x| get_parent(id_x) }.uniq.size
  end
end
#---------------------------------------

N, M = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)

uf = UnionFind.new(N)
pp uf.parent

a.each { |re_num|
  uf.merge(re_num, re_num + 1)
}

pp uf
