class MoveToFront
  def encode(data)
    table = []
    encoded = ""

    data.split("") do |char|
      char_index = table.find_index(char)
      if char_index.nil?
        table.insert(0, char)
        encoded << char 
      else
        table.delete_at(char_index)
        table.insert(0, char)
        encoded << char_index.to_s
      end
    end

    encoded
  end

  def decode(data)
    table = []
    decoded = ""

    data.split("") do |char|
      if char =~ /[0-9]/
        char_index = char.to_i
        table_char = table[char_index]
        decoded << table_char
        table.delete_at(char_index)
        table.insert(0, table_char)
      else
        decoded << char
        table.insert(0, char)
      end
    end

    decoded
  end
end
