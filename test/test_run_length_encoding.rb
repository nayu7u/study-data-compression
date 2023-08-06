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

  def test_encode6
    assert_equal [0, 3], @rle.encode([0, 2])
  end

  def test_encode7
    assert_equal [1, 3, 4], @rle.encode([0, 0, 2, 3])
  end

  def test_decode1
    assert_equal [0], @rle.decode([0])
  end

  def test_decode2
    assert_equal [0, 0], @rle.decode([1])
  end

  def test_decode3
    assert_equal [0, 0, 0], @rle.decode([0, 0])
  end

  def test_decode4
    assert_equal [1, 2, 3], @rle.decode([2, 3, 4])
  end

  def test_decode5
    assert_equal [254, 255], @rle.decode([255, 0, 255, 1])
  end

  def test_decode6
    assert_equal [0, 2], @rle.decode([0, 3])
  end

  def test_decode6
    assert_equal [0, 0, 2, 3], @rle.decode([1, 3, 4])
  end

  def test_encode_decode1
    target = [0, 2, 3, 0]
    assert_equal target, @rle.decode(@rle.encode(target))
  end

  def test_random_encode_decode
    target = 10000.times.map { (0..255).to_a.sample }
    assert_equal target, @rle.decode(@rle.encode(target))
  end
end
