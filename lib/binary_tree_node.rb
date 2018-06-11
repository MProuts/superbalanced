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

  # def leaf?
  # end

  def depth
    @depth
  end

  def superbalanced?
    if !(@left || @right)
      true
    else
      false
    end
  end
end
