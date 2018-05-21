require 'test/unit'

class MatchingTests < Test::Unit::TestCase
  def test_this
    assert_equal(true, match([5,1,2,3,4,8], 6))
    assert_equal(false, match([5,3,4,8], 6))
    assert_equal(true, match([5,3,4,3,8], 6))
    assert_equal(false, match([5,3,4,7,8], 6))
  end
end


def match(arr, sum)
  h = Hash.new

  arr.each do |v|
    return true unless h[v].nil?
    subtr = sum - v
    h[subtr] = 1
  end
  false 
end
