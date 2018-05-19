require 'test/unit'

class MergeTests < Test::Unit::TestCase

  def testRec
    assert_equal [1,3,5,6,7,9,47,54,79], mergeRec([5,7,79,9,3,47,6,54,1])
  end

  def testLoop
    assert_equal [1,3,5,6,7,9,47,54,79], mergeLoop([5,7,79,9,3,47,6,54,1])
  end
end

def mergeRec(arr)
  if arr.size < 2
    arr
  else
    a1 = mergeRec arr.slice(0, arr.size / 2)
    a2 = mergeRec arr.slice(arr.size / 2, arr.size - 1)
    merge = []
    while !a1.empty? || !a2.empty?
      merge << a1.shift if a2.empty? && !a1.empty?
      merge << a2.shift if a1.empty? && !a2.empty?
      a1.first > a2.first ? merge << a2.shift : merge << a1.shift if !a1.empty? && !a2.empty?
    end
    merge
  end
end

def mergeLoop(arr)
  i = 1
  loop do
    p i
    break if i >= arr.count / 2
    f = 0
    s = f + i

    temp_arr  = []

    loop do
      if arr[f] < arr[s]
        temp_arr << arr[f]
        f += 1
      else
        temp_arr << arr[f]
        s += 1
      end
    end

    arr = temp_arr
    i   += 1
  end
  arr
end
