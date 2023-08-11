require_relative "burrows_wheeler_transform"
require_relative "move_to_front"
require_relative "run_length_encoding"
require_relative "huffman_coding"

class Main
  attr_accessor :debug_data

  def initialize(debug = false)
    @bwt = BurrowsWheelerTransform.new
    @mtf = MoveToFront.new
    @rle = RunLengthEncoding.new
    @hc = HuffmanCoding.new

    @debug = debug
    @debug_data = {}
  end

  def encode(bytes)
    bwt_encoded, index = @bwt.encode(bytes)
    mtf_encoded = @mtf.encode(bwt_encoded)
    rle_encoded = @rle.encode(mtf_encoded)
    hex_index = index.to_s(16).split("").map(&:hex)
    size = hex_index.size

    if @debug
      @debug_data[:encode_size] = size
      @debug_data[:encode_index] = index
      @debug_data[:encode_hex_index] = hex_index
      @debug_data[:encode_rle_encoded] = rle_encoded
      @debug_data[:encode_mtf_encoded] = mtf_encoded
      @debug_data[:encode_bwt_encoded] = bwt_encoded
    end

    [size, *hex_index, *rle_encoded]
  end

  def decode(bytes)
    size, *mixed = bytes
    hex_index = mixed[0..(size - 1)]
    index = hex_index.map { _1.to_s(16) }.join.hex
    rle_encoded = mixed[size..]
    mtf_encoded = @rle.decode(rle_encoded)
    bwt_encoded = @mtf.decode(mtf_encoded)

    if @debug
      @debug_data[:decode_size] = size
      @debug_data[:decode_index] = index
      @debug_data[:decode_hex_index] = hex_index
      @debug_data[:decode_rle_encoded] = rle_encoded
      @debug_data[:decode_mtf_encoded] = mtf_encoded
      @debug_data[:decode_bwt_encoded] = bwt_encoded
    end

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
    File.open(decoded_path, "wb") { |f| decoded.each{ f.putc(_1) } }
  end
end

