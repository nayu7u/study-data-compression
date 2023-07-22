require "minitest/autorun"
require_relative "../move_to_front.rb"
require "securerandom"

class MoveToFrontTest < Minitest::Test
  def setup
    @mtf = MoveToFront.new
  end

  def test_encode1
    assert_equal [0, 1, 0, 2], @mtf.encode([0, 0, 1, 2])
  end

  def test_decode1
    assert_equal [0, 0, 1, 2], @mtf.decode([0, 1, 0, 2])
  end

  def test_encode_decode
    random_bytes = SecureRandom.random_bytes(100).bytes
    assert_equal random_bytes, @mtf.decode(*@mtf.encode(random_bytes))
  end
end
