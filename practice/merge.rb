require 'test/unit'

class MergeTests < Test::Unit::TestCase

  def testRec
    assert_equal [1,3,5,6,7,9,47,54,79], mergeRec([5,7,79,9,3,47,6,54,1])
  end

  def testLoop
    # assert_equal [1,3,5,6,7,9,47,54,79], mergeLoop([5,7,79,9,3,47,6,54,1])
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
  temp_arr = arr
  start = 0 
  f = start
  s = f + i

  loop do
    break if i > arr.count / 2
    p temp_arr
    arr_t = Array.new
    loop do 
      # p "#{arr_t} - #{start} - #{f} - #{s}"

      if f >= start + i || s >= start + ( 2 * i )
        if f >= start + i 
          arr_t << temp_arr[s]
          s += 1
        else 
          arr_t << temp_arr[f]
          f += 1
        end
      elsif temp_arr[f] > temp_arr[s]
        arr_t << temp_arr[s]
        s += 1
      else
        arr_t << temp_arr[f]
        f += 1
      end
      # p "#{arr_t} - #{start} - #{f} - #{s}"

      if f >= ( start + i ) && s >= ( start + ( 2 * i )) 
        start += 2 * i  
        f = start 
        s = f + i
      end

      if s >= temp_arr.count - 1
        loop do 
          break if f >= temp_arr.count
          arr_t << temp_arr[f]
          f += 1
        end
        break 
      end
    end

    temp_arr = arr_t

    i *= 2
    start = 0 
    f = start
    s = f + i
  end
  temp_arr
end
