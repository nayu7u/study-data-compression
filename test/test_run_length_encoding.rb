require "minitest/autorun"
require_relative "../run_length_encoding.rb"

class RunLengthEncodingTest < Minitest::Test
  def setup
    @rle = RunLengthEncoding.new
  end

  def test_encode1
    assert_equal [0, 3, 1, 0, 1, 2, 2, 3], @rle.encode([0, 0, 0, 1, 0, 2, 2, 3])
  end

  def test_encode2
    assert_equal [0, 5, 100, 125, 0, 1, 1, 0, 1], @rle.encode([0, 0, 0, 0, 0, 100, 125, 0, 1, 0])
  end

  def test_decode1
    assert_equal [0, 0, 0, 1, 0, 2, 2, 3], @rle.decode([0, 3, 1, 0, 1, 2, 2, 3])
  end

  def test_encode_decode
    target = [0, 0, 0, 0, 0, 100, 125, 0, 1, 0]
    assert_equal target, @rle.decode(@rle.encode(target))
  end
end
