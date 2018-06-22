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
  
  def inspect
    puts "<PolyTreeNode: #{self.object_id}, @value = #{value}"
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    
    @children.each do |child|
      sub_search = child.dfs(target_value)
      return sub_search unless sub_search.nil?
    end
    return nil
    # p self
    # return self if self.value == target_value
    # @children.each do |child|
    #   p self
    #   return child if child.value == target_value
    #   if child.children != []
    #     child.dfs(target_value)
    #   else
    #     return child if child.value == target_value
    #   end
    # end
    # nil
  end
end









