p "hello"
p "b"

class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    # child_node.parent = other_node
    def parent=(other_node) #this call on the child. other_node is parent.
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

    def inspect
        value
    end

    def dfs(target_value)
        return self if self.value == target_value
              
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        arr = [self]
        
        while arr.length > 0            
            arr.each do |node|
                return node if node.value == target_value                
                arr += node.children 
                arr.shift                
            end
        end
        nil
    end
   

end