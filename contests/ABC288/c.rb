# ref. https://qiita.com/k_karen/items/5349a25c3eb7b4697f58
class UnionFind
  def initialize(size)
    @rank = Array.new(size, 0)
    @parent = Array.new(size, &:itself)
  end

  def unite(id_x, id_y)
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

union = UnionFind.new(N)
loop_num = 0

M.times do
  u, v = gets.chomp.split.map{|g| g.to_i - 1}

  # 同じ親を持つ、閉路を作ってしまう場合は閉路の数として加算
  if union.same_parent?(u, v)
    loop_num += 1
  else
    union.unite(u, v)
  end
end

# 閉路が見つかれば閉路ごとに必ず1つ削除するため、答えは閉路の数
p loop_num
