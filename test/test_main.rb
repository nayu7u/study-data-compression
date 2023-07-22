require "minitest/autorun"
require_relative "../main.rb"
require "securerandom"

class MainTest < Minitest::Test
  def setup
    @main = Main.new
  end

  def test_encode_decode
    random_bytes = SecureRandom.random_bytes(100).bytes
    assert_equal random_bytes, @main.decode(@main.encode(random_bytes))
  end
end
