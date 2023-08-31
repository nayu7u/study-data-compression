require "minitest/autorun"
require_relative "../lib/burrows_wheeler_transform.rb"
require "securerandom"

class BurrowsWheelerTransformTest < Minitest::Test
  def setup
    @bwt = BurrowsWheelerTransform.new
  end

  def test_encode
    assert_equal ["occaa".bytes, 3], @bwt.encode("cacao".bytes)
  end

  def test_decode
    assert_equal "cacao".bytes, @bwt.decode("occaa".bytes, 3)
  end

  def test_encode_decode
    assert_equal "Hello, world!".bytes, @bwt.decode(*@bwt.encode("Hello, world!".bytes))
  end

  def test_binary_encode_decode
    random_bytes = SecureRandom.random_bytes(10000).bytes
    assert_equal random_bytes, @bwt.decode(*@bwt.encode(random_bytes))
  end
end

