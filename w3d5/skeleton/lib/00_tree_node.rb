class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        @parent = parent_node
        if !parent_node.children.include?(self) && parent_node.parent != nil
            node.children << self
        end
    end



    


    

end