# zero run length encoding
class RunLengthEncoding
  def encode(array)
    encoded = []
    zero_count = 0
    array.each do |n|
      if zero_count.positive?
        if n.zero?
          zero_count += 1 
        else
          encoded.concat([0, zero_count, n])
          zero_count = 0
        end
      else
        if n.zero?
          zero_count += 1
        else
          encoded << n
        end
      end
    end
    encoded.concat([0, zero_count]) if zero_count.positive?
    encoded
  end

  def decode(array)
    decoded = []
    zero_flag = false
    array.each do |n|
      if zero_flag
        decoded.concat([0]*n)
        zero_flag = false
      else
        if n.zero?
          zero_flag = true
        else
          decoded << n
        end
      end
    end
    decoded
  end
end
