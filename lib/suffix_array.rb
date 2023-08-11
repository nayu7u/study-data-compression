class SuffixArray
  def initialize(bytes)
    @bytes = bytes

    sort
  end

  def last_column
    @sorted.map { |i| (@bytes*2)[i+@length] }
  end

  def bwt_index
    @sorted.find_index(0)
  end

  private

  def sort
    @length = @bytes.size - 1
    @sorted = @bytes
      .size
      .times
      .to_a
      .sort { |i, j| (@bytes*2)[i..i+@length] <=> (@bytes*2)[j..j+@length] }
  end
end
