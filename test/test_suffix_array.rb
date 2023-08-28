require "minitest/autorun"
require_relative "../lib/suffix_array.rb"
require "securerandom"

class SuffixArrayTest < Minitest::Test
  def setup
    @sa = SuffixArray.new("abracadabra".bytes)
  end

  def test_last_column
    assert_equal "rdarcaaaabb".bytes, @sa.last_column
  end

  def test_bwt_index
    assert_equal 3, @sa.bwt_index
  end
end

