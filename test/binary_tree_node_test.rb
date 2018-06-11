gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require_relative '../lib/binary_tree_node'

# BinaryTreeNodeTest
class BinaryTreeNodeTest < MiniTest::Test
  def test_single_node
    assert BinaryTreeNode.new(1).superbalanced?
  end

  # ##############
  # leaf?
  # ##############

  # ##############
  # depth
  # ##############
  def test_root_node_depth
    root = BinaryTreeNode.new(0)
    assert_equal 0, root.depth
  end

  def test_first_generation_left_node_depth
    root = BinaryTreeNode.new(0)
    left_child = root.insert_left(1)

    assert_equal 1, left_child.depth
  end

  def test_first_generation_right_node_depth
    root = BinaryTreeNode.new(0)
    right_child = root.insert_right(1)

    assert_equal 1, right_child.depth
  end

  def test_second_generation_depth
    root = BinaryTreeNode.new(0)
    left_child = root.insert_left(1)
    right_grandchild = left_child.insert_right(2)

    assert_equal 2, right_grandchild.depth
  end

  # ##############
  # superbalanced?
  # ##############
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
