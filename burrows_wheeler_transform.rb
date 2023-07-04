class BurrowsWheelerTransform
  def encode(data)
    splited = data.split('')

    matrix = splited
      .size
      .times
      .inject([]) { |r, i| r << splited.rotate(0-i) }

    [matrix.sort.map(&:last).join, matrix.sort.find_index(splited)]
  end

  def decode(data, n)
    splited = data.split('')
    sorted = splited.sort
    indices = splited.size.times.map(&:to_i)
    ziped = splited.zip(sorted, indices)
    sorted_indices = ziped.sort.map(&:last)

    index = n - 1
    decoded = []
    sorted_indices.size.times.map {
      target = sorted_indices[index]
      decoded << data[target]
      index = target
    }

    decoded
  end
end

