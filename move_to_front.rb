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
  end
end
