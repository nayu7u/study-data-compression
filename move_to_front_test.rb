require "minitest/autorun"
require_relative "move_to_front.rb"

class MoveToFrontTest < Minitest::Test
  def setup
    @mtf = MoveToFront.new
  end

  def test_encode1
    assert_equal [[97], [0]], @mtf.encode("a")
  end

  def test_encode2
    assert_equal [[97, 98], [0, 0, 1, 0]], @mtf.encode("aabb")
  end

  def test_decode1
    assert_equal "a", @mtf.decode([97], [0])
  end

  def test_decode2
    assert_equal "aabb", @mtf.decode([97, 98], [0, 0, 1, 0])
  end

  def test_encode_decode
    assert_equal "ababacaca", @mtf.decode(*@mtf.encode("ababacaca"))
  end

  def test_encode_decode_include_number
    assert_equal "1a1ba11bacaca", @mtf.decode(*@mtf.encode("1a1ba11bacaca"))
  end
end
