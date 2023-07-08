require "minitest/autorun"
require_relative "move_to_front.rb"

class MoveToFrontTest < Minitest::Test
  def setup
    @mtf = MoveToFront.new
  end

  def test_encode
    assert_equal "ab111c111", @mtf.encode("ababacaca")
  end

  def test_decode
    assert_equal "ababacaca", @mtf.decode("ab111c111")
  end

  def test_encode_decode
    assert_equal "ababacaca", @mtf.decode(@mtf.encode("ababacaca"))
  end

  def test_encode_decode_include_number
    assert_equal "1a1ba11bacaca", @mtf.decode(@mtf.encode("1a1ba11bacaca"))
  end
end
