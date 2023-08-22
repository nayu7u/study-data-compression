require "minitest/autorun"
require_relative "../lib/suffix_array.rb"
require "securerandom"

class SuffixArrayTest < Minitest::Test
  def setup
    @sa = SuffixArray.new("abracadabra".bytes)
  end

  def test_sort
    assert_equal "rdarcaaaabb".bytes.pack("c*"), @sa.last_column.pack("c*")
  end

  # def test_last_column
  #   assert_equal "rdarcaaaabb".bytes, @sa.last_column
  # end

  # def test_bwt_index
  #   assert_equal 2, @sa.bwt_index
  # end
end

