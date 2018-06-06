require 'rspec/autorun'

describe "Binary tree" do 
  before(:each) do 
    a = [6,2,4,1,4,5,7,3]
    #      6
    # 2         7
    #1 4
    # 3 4
    #    5
    @binary_tree = Node.new(nil)
    a.each_with_index do |v, i|
      if i == 0 
        @binary_tree.value = v
      else 
        build_tree(@binary_tree, v)
      end
    end
  end
  describe "#find_parent" do 

    it " to get correct parent" do 
      expect(find_common_parent(@binary_tree, 2, 7)).to be(6)
      expect(find_common_parent(@binary_tree, 1, 4)).to be(2)
      expect(find_common_parent(@binary_tree, 3, 4)).to be(4)
    end
  end
end

class Node 
  attr_accessor :value, :left_node, :right_node

  def initialize(value)
    self.value = value
    self.left_node = nil
    self.right_node = nil
  end
end

def build_tree(parent, value)
  if parent.value > value
    if parent.left_node.nil?
      parent.left_node = Node.new(value)
    else
      build_tree(parent.left_node, value)
    end
  else 
    if parent.right_node.nil?
      parent.right_node = Node.new(value)
    else
      build_tree(parent.right_node, value)
    end
  end
end

def display(node)
  p "#{node.value}"
  display(node.left_node) unless node.left_node.nil?
  display(node.right_node) unless node.right_node.nil?
end

def find_common_parent(node, v1, v2)
  if node.value > v1 && node.value > v2
    return find_common_parent(node.left_node, v1, v2)
  elsif node.value <= v1 && node.value <= v2
    return find_common_parent(node.right_node, v1, v2)
  else 
    return node.value
  end
  return false
end
