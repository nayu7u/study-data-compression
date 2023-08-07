require "minitest/autorun"
require_relative "../main.rb"
require "securerandom"

class MainTest < Minitest::Test
  def setup
    @main = Main.new
  end

  def test_random_encode_decode
    random_bytes = SecureRandom.random_bytes(10000).bytes
    assert_equal random_bytes, @main.decode(@main.encode(random_bytes))
  end

  def test_simple_encode_decode
    bytes = [1, 1, 1, 0, 0, 0]
    assert_equal bytes, @main.decode(@main.encode(bytes))
  end
end
