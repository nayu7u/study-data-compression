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
  end
end

p BurrowsWheelerTransform.new.encode('cacao')
p BurrowsWheelerTransform.new.decode('cacao', 3)
