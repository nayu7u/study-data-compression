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

  def encode(bytes)
    bwt_encoed, index = @bwt.encode(bytes)
    mtf_encoded = @mtf.encode(bwt_encoed)
    rle_encoded = @rle.encode(mtf_encoded)
    hex_index = index.to_s(16).split("")
    size = hex_index.size
    [size, *hex_index, *rle_encoded]
  end

  def decode(bytes)
    size, *mixed = bytes
    hex_index = mixed[0..(size - 1)]
    index = hex_index.join("").hex
    rle_encoded = mixed[size..]
    mtf_encoded = @rle.decode(rle_encoded)
    bwt_encoded = @mtf.decode(mtf_encoded)
    bytes = @bwt.decode(bwt_encoded, index)
  end

  def encode_from_file(source_path, encoded_path)
    bytes = File.open(source_path, "rb") { _1.read.bytes }
    encoded = encode(bytes)
    File.open(encoded_path, "wb") { |f| encoded.each{ f.putc(_1) } }
  end

  def decode_from_file(encoded_path, decoded_path)
    bytes = File.open(encoded_path, "rb") { _1.read.bytes }
    decoded = decode(bytes)
    File.open(encoded_path, "wb") { |f| decoded.each{ f.putc(_1) } }
  end
end

