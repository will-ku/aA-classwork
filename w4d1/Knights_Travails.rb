require_relative "00_tree_node"

class KnightPathFinder
    attr_accessor :parent, :children
    attr_reader :root_node, :considered_positions    

    def self.valid_moves(pos) #[x,y]
        moves = [ [1,2], [-1,2], [-1,-2], [1,-2], [2,1], [-2,1], [-2,-1], [2,-1] ]
        valid_moves = []
        moves.each do |mov|
            if pos[0]+mov[0]<8 && pos[1]+mov[1]<8 && pos[0]+mov[0]>=0 && pos[1]+mov[1] >= 0
                valid_moves << [ pos[0]+mov[0] , pos[1]+mov[1] ]
            end
        end
        valid_moves        
    end



    def initialize(start_position)        
        @start_position = start_position
        @root_node = PolyTreeNode.new(start_position)        
        @considered_positions = [start_position]
        build_move_tree
    end

    def new_move_positions(parent_node) #take in position
        moves = KnightPathFinder.valid_moves(parent_node.value) 
        moves.reject! { |move| @considered_positions.include?(move) }   #remove dup moves
        moves.each { |move| @considered_positions << move }     #adds to 'considered pos' arr
        nodes_arr = moves.map {|move| PolyTreeNode.new(move) }  #create node instances
        nodes_arr.each do |node|    #sets the parent and child node relationship
            node.parent = parent_node
        end
        # p nodes_arr
        return nodes_arr #returns arr w/ nodes with parent children relationships set
    end

    def build_move_tree
        remaining_pos = [@root_node]

        while remaining_pos.length > 0
            remaining_pos.each do |pos| # SP
                remaining_pos += new_move_positions(pos)
                remaining_pos.shift
            end
        end
    end

    # search for end_pos in the move tree
    # return the tree node instance containing end_pos
    # returns a node

    # thoughts: call BMT, find path,
    def find_path(end_pos)
        
        nodes_arr = [root_node]

        while nodes_arr.length > 0
            nodes_arr.each do |node|
                return trace_path_back(node) if node.value == end_pos
                nodes_arr += node.children
                nodes_arr.shift
            end
        end
        nil     
    end

#     # race back from the node to the root using PolyTreeNode#parent
#     # returns array of positions
    def trace_path_back(end_node)
        return [end_node.value] if !end_node.parent
        trace_path_back(end_node.parent) + [end_node.value] 
    end

end

k = KnightPathFinder.new([0,0])

p k.find_path([7,6])
p k.find_path([6,2])


