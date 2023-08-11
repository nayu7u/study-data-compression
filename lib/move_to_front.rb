class MoveToFront
  def encode(byte_array)
    symbol_list = 256.times.to_a
    index_array = []

    byte_array.each do |b|
      index_array << symbol_list.find_index(b)
      symbol_list.delete(b)
      symbol_list.insert(0, b)
    end

    index_array
  end

  def decode(index_array)
    symbol_list = 256.times.to_a
    byte_array = []

    index_array.each do |index|
      byte = symbol_list[index]
      byte_array << byte
      symbol_list.delete(byte)
      symbol_list.insert(0, byte)
    end

    byte_array
  end
end
