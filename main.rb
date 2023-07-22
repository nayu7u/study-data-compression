require "./burrows_wheeler_transform"
require "./move_to_front"
require "./run_length_encoding"
require "./huffman_coding"

class Main
  def initialize
    @bwt = BurrowsWheelerTransform.new
    @mtf = MoveToFront.new
    @rle = RunLengthEncoding.new
    @hc = HuffmanCoding.new
  end

  def encode(data)
    # bwt_sorted, index = @bwt.encode(data)
    # mtf_sorted = @mtf.encode(bwt_sorted)
    # @rle.encode()
    # @hc.encode()
    data
  end

  def decode(data)
    data
  end
end

