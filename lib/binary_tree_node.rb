class BinaryTreeNode
  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
  end

  # def leaf?
  # end

  # def depth
  # end

  def superbalanced?
    if !(@left || @right)
      true
    else
      false
    end
  end
end


