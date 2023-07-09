class MoveToFront
  def encode(data)
    symbol_list = data.bytes.uniq
    symbol_list_clone = symbol_list.dup
    encoded = []

    data.each_byte do |b|
      encoded << symbol_list.find_index(b)
      symbol_list.delete(b)
      symbol_list.insert(0, b)
    end

    [symbol_list_clone, encoded]
  end

  def decode(symbol_list, encoded)
    decoded = ""

    encoded.each do |index|
      byte = symbol_list[index]
      decoded << byte
      symbol_list.delete(byte)
      symbol_list.insert(0, byte)
    end

    decoded
  end
end
