require "minitest/autorun"
require_relative "../run_length_encoding.rb"

class RunLengthEncodingTest < Minitest::Test
  def setup
    @rle = RunLengthEncoding.new
  end

  def test_encode1
    assert_equal [0], @rle.encode([0])
  end

  def test_encode2
    assert_equal [1], @rle.encode([0, 0])
  end

  def test_encode3
    assert_equal [0, 0], @rle.encode([0, 0, 0])
  end

  def test_encode4
    assert_equal [2, 3, 4], @rle.encode([1, 2, 3])
  end

  def test_encode5
    assert_equal [255, 0, 255, 1], @rle.encode([254, 255])
  end
end
