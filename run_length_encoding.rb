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
    c = array.shift
    decoded = []
    buff = []
    count = 0
    while !c.nil? do
      if c <= 1
        count = 1
        buff << c
        loop do
          c = array.shift
          break if c.nil? || c > 1
          buff << c
        end
        num_of_zeros = ([1] + buff).join("").to_i(2) - 1
        decoded.concat([0] * num_of_zeros)
      else
        if c == 255
          c = array.shift
          if c.zero?
            decoded << 254
          else
            decoded << 255
          end
        else
          decoded << c - 1
        end
      end

      c = array.shift
    end

    decoded
  end
end
