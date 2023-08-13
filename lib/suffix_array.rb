class SuffixArray
  def initialize(bytes)
    @bytes = bytes
    #@length = @bytes.size - 1
    @length = @bytes.size

    sort
  end

  def last_column
    @sorted.map { |i| (@bytes*2)[i+@length] }
  end

  def bwt_index
    @sorted.find_index(0)
  end

  def sort
    #@sorted = @bytes
    #  .size
    #  .times
    #  .to_a
    #  .sort { |i, j| (@bytes*2)[i..i+@length] <=> (@bytes*2)[j..j+@length] }
    
    # rankの初期値はbyte値とする
    sa = @bytes.times.to_a
    rank = @bytes

    # 末尾番兵を用意
    sa << sa.last + 1
    rank << -1

    k = 1
    while k <= @length
      sa.sort_by! { |sa_i, sa_j|
        
      }

      k *= 2
    end

  end
end
