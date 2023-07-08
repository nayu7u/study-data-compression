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
    assert_equal "ababacaca", @mtf.encode("ab111c111")
  end
end
