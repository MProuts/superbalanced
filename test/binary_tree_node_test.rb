gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative '../lib/binary_tree_node'

class BinaryTreeNodeTest < MiniTest::Test
  def test_single_node
    assert BinaryTreeNode.new(1).superbalanced?
  end

  def test_just_barely_not_superbalanced
    root = BinaryTreeNode.new(1)
    root.insert_right(2)
    root.insert_left(3).insert_left(4).insert_left(5)
    refute root.superbalanced?
  end

  def test_one_generation_superbalanced
    root = BinaryTreeNode.new(1)
    root.insert_right(2)
    root.insert_left(3)
    assert root.superbalanced?
  end
end
