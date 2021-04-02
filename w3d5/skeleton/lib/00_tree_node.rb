class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    
    def parent=(other_node)
        unless other_node == nil
            @parent.children.reject! { |ele| ele == self } if @parent != nil
            @parent = other_node
                if !other_node.children.include?(self) 
                    other_node.children << self
                end
        else
            @parent = nil
        end 
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise Error if !@children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            break if child.children.length == 0
        end
    end


    

end