class BurrowsWheelerTransform
  def encode(bytes)
    matrix = bytes
      .size
      .times
      .inject([]) { |r, i| r << bytes.rotate(0-i) }

    [matrix.sort.map(&:last), matrix.sort.find_index(bytes)]
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

