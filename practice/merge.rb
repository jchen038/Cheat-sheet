require 'test/unit'

class MergeTests < Test::Unit::TestCase

	def testRec
		assert_equal mergeRec([5,7,79,9,3,47,6,54,1]), [1,3,5,6,7,9,47,54,79]
	end

	def testLoop
		assert_equal mergeLoop([5,7,79,9,3,47,6,54,1]), [1,3,5,6,7,9,47,54,79]
	end
end

def mergeRec(arr)
	if arr.size < 2
		return arr
	else
		a1 = mergeRec arr.slice(0, arr.size / 2)
		a2 = mergeRec arr.slice(arr.size / 2, arr.size - 1)
		merge = []
		while !a1.empty? || !a2.empty?
			merge << a1.shift if a2.empty? && !a1.empty?
			merge << a2.shift if a1.empty? && !a2.empty?
			a1.first > a2.first ? merge << a2.shift : merge << a1.shift if !a1.empty? && !a2.empty?
		end
		return merge
	end
end

def mergeLoop(arr) 
  i = 1
  while i < arr.size / 2 
    p i
    p arr
    c = (arr.size/i.to_f).ceil
    m = []
    j = 0 
    t = 0 
    while t < (arr.size/c.to_f).ceil 
      begin 
        p "#{arr[j]} #{arr[j+i]}"
        if arr[j].nil? || arr[j+i].nil?
          m << arr[j] if !arr[j].nil?
          m << arr[j+i] if !arr[j+i].nil?
        else
          if arr[j] < arr[j+i]
            m << arr[j]
            m << arr[j+i]
          else
            m << arr[j+i]
            m << arr[j]
          end
        end while j > c
        j = j + 1
      end
      t = t + 1
    end
    arr = m
    i = i + 1
  end
  arr
end