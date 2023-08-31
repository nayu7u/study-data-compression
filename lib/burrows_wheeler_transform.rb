require_relative "suffix_array"

class BurrowsWheelerTransform
  def encode(bytes)
    sa = SuffixArray.new(bytes)
    bwt_index = sa.bwt_index
    last_column = sa.last_column

    [last_column, bwt_index]
  end

  def decode(bytes, n)
    bytes.insert(n, -1)
    sorted = bytes.sort
    indices = bytes.size.times.map(&:to_i)
    ziped = bytes.zip(sorted, indices)
    sorted_indices = ziped.sort.map(&:last)

    index = n
    decoded = []
    sorted_indices.size.times.each {
      target = sorted_indices[index]
      decoded << bytes[target]
      index = target
    }

    decoded.reject! { _1 == -1 }
  end
end

