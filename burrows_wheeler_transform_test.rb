require "minitest/autorun"
require_relative "burrows_wheeler_transform.rb"

class BurrowsWheelerTransformTest < Minitest::Test
  def setup
    @bwt = BurrowsWheelerTransform.new
  end

  def test_encode
    assert_equal ["ccoaa", 2], @bwt.encode("cacao")
  end

  def test_decode
    assert_equal "cacao", @bwt.decode("ccoaa", 2)
  end

  def test_encode_decode
    assert_equal "Hello, world!", @bwt.decode(*@bwt.encode("Hello, world!"))
  end
end

