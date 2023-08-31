class SuffixArray
  def initialize(bytes)
    @bytes = bytes.dup
    @length = @bytes.size
    @sorted = sort
    @index = @sorted.find_index(0)
  end

  def last_column
    @sorted.reject { _1 == 0 }.map { |i| @bytes[i - 1] }
  end

  def bwt_index
    @index
  end

  def sort
    sa = @length.times.to_a
    # rankの初期値はbyte値とする
    rank = @bytes.dup

    # 末尾番兵を用意
    sa << sa.last + 1
    rank << -1

    k = 1
    while k <= @length
      # 2kずつsort
      sa.sort! { |sa_i, sa_j| compare(sa_i, sa_j, k, rank) }
      
      # rank算出
      tmp = Array.new(sa.size)
      tmp[sa[0]] = 0
      for i in 1..@length do
        tmp[sa[i]] = tmp[sa[i - 1]] + (compare(sa[i - 1], sa[i], k, rank) < 0 ? 1 : 0)
      end

      # rank更新
      rank = tmp

      k *= 2
    end

    sa
  end

  private

  def compare(sa_i, sa_j, k, rank)
    unless rank[sa_i] == rank[sa_j]
      rank[sa_i] - rank[sa_j]
    else
      rank_i = (sa_i + k <= @length) ? rank[sa_i + k] : -1
      rank_j = (sa_j + k <= @length) ? rank[sa_j + k] : -1

      rank_i - rank_j
    end
  end
end
