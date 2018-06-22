class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  
  def parent=(node)
    @parent.children.delete(self) if @parent
    @parent = node
    node.children << self unless node.nil? || node.children.include?(self)
  end
end