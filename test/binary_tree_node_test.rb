gem 'minitest', '~> 5.4'
gem 'minitest-reporters'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/binary_tree_node'

#Use Minitest-reporters for colorful test results
Minitest::Reporters.use!

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

  # #############
  # leaves
  # #############
  def test_empty_root_leaves
    root = BinaryTreeNode.new(1)
    assert_equal [root], root.leaves
  end

  def test_one_leaf_tree_leaves
    root = BinaryTreeNode.new(1)
    left = root.insert_left(2)
    assert_equal [left], root.leaves
  end

  def test_one_other_leaf_tree_leaves
    root = BinaryTreeNode.new(1)
    right = root.insert_right(2)
    assert_equal [right], root.leaves
  end

  def test_two_leaves_tree_leaves
    root = BinaryTreeNode.new(1)
    left = root.insert_left(2)
    right = root.insert_right(2)

    assert_equal 2, root.leaves.length
    assert root.leaves.include?(left)
    assert root.leaves.include?(right)
  end

  def test_three_deep_tree_leaves
    root = BinaryTreeNode.new(1)
    left = root.insert_left(2)
    right = root.insert_right(3)
    right_left = right.insert_left(4)
    right_right = right.insert_right(5)

    assert_equal 3, root.leaves.length
    assert root.leaves.include?(left)
    assert root.leaves.include?(right_left)
    assert root.leaves.include?(right_right)
  end

  # ##############
  # superbalanced?
  # ##############
  def test_empty_root_superbalanced
    root = BinaryTreeNode.new(1)
    assert root.superbalanced?
  end

  def test_one_leaf_root_superbalanced
    root = BinaryTreeNode.new(1)
    root.insert_right(2)
    assert root.superbalanced?
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

  def test_three_generation_superbalanced
    root = BinaryTreeNode.new(1)
    left = root.insert_left(2)
    right = root.insert_right(3)
    right_left = right.insert_left(4)
    right_right = right.insert_right(5)

    assert root.superbalanced?
  end
end
