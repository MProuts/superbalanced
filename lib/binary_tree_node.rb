# BinaryTreeNode
class BinaryTreeNode
  def initialize(value, depth = 0)
    @value = value
    @left  = nil
    @right = nil
    @depth = depth
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value, @depth + 1)
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value, @depth + 1)
  end

  def depth
    @depth
  end

  def leaves
    if @left.nil? && @right.nil?
      [self]
    elsif @left.nil? && @right
      @right.leaves
    elsif @left && @right.nil?
      @left.leaves
    elsif @left && @right
      @left.leaves + @right.leaves
    end
  end

  def superbalanced?
    depths = leaves.map(&:depth)
    (depths.max - depths.min) <= 1
  end
end
