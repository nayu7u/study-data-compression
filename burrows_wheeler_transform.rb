class BurrowsWheelerTransform
  def encode(bytes)
    length = bytes.size - 1
    sorted = bytes
      .size
      .times
      .to_a
      .sort { |i, j| (bytes*2)[i..i+length] <=> (bytes*2)[j..j+length] }

    [sorted.map { |i| (bytes*2)[i+length] }, sorted.find_index(0)]
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

