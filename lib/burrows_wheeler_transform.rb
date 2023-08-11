require_relative "suffix_array"

class BurrowsWheelerTransform
  def encode(bytes)
    sa = SuffixArray.new(bytes)

    [sa.last_column, sa.bwt_index]
  end

  def decode(bytes, n)
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

    decoded
  end
end

