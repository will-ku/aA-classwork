require_relative "piece"
require_relative "slideable"
class Queen < Piece
    include Slideable
    def initialize
        # if color == black   POTENTIAL LOGIC FOR POSITION ASSIGNMENT
        #     @pos = [0,3]
        # else 
        #     @pos = [7,3]
        # end

    end

    private 

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end



end