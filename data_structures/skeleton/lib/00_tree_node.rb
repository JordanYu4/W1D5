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
  
  def add_child(child_node)
    @children << child_node unless @children.include?(child_node)
    child_node.parent = self
  end
  
  def remove_child(child_node)
    if child_node.parent != self
      raise "Not a child"
    end
    child_node.parent = nil
    @children.delete(child_node)
    
  end
  
end