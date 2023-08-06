# zero run length encoding
class RunLengthEncoding
  def encode(array)
    c = array.shift
    encoded = []
    count = 0
    while !c.nil? do
      if c.zero?
        count = 0
        while !c.nil? && c.zero?
          count += 1
          c = array.shift
        end
        count += 1
        while count != 1
          encoded << (count & 1)
          count >>= 1
        end
      else
        if c.to_s(16) == "fe"
          encoded << (255)
          encoded << (0)
        elsif c.to_s(16) == "ff"
          encoded << (255)
          encoded << (1)
        else
          encoded << c + 1
        end

        c = array.shift
      end
    end

    encoded
  end

  def decode(array)
  end
end
