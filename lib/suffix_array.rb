class SuffixArray
  def initialize(bytes)
    @bytes = bytes
    @length = @bytes.size
    @sorted = sort
    p @sorted
    @sorted.each { p _1; p ((@bytes + [nil])*2)[_1..(_1+@sorted.length)].compact.pack("c*") }
    @sorted.reject! { _1 == @length }
    p @sorted
    p "="*100
  end

  def last_column
    # @sorted.map { |i| @bytes[i - 1] }.reject! { _1 == -1 }
    @sorted.map { |i| @bytes[i - 1] }.tap{p _1}
  end

  def bwt_index
    # @sorted.find_index(0)
    @sorted.find_index(0).tap{p _1}
  end

  def sort
    sa = @length.times.to_a
    # rankの初期値はbyte値とする
    rank = @bytes

    # 末尾番兵を用意
    sa << sa.last + 1
    rank << -1

    # sa.each { p _1; p ((@bytes + [nil])*2)[_1..(_1+sa.length)].compact.pack("c*") }
    # p "=" * 100

    k = 1
    while k <= @length
      # 2kずつsort
      sa.sort! { |sa_i, sa_j| compare(sa_i, sa_j, k, rank) }
      # sa.each { p _1; p ((@bytes + [nil])*2)[_1..(_1+sa.length)].compact.pack("c*") }
      # p "=" * 100
      
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
