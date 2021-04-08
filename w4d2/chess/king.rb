require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable
    
    def initialize(color,board, pos)
        super
    end

    def symbol
        "K".colorize(color)
    end

    protected

    def moves_diff
        [[1,1], [1,-1], [-1,1], [-1,-1], [0,1], [0,-1], [-1,0], [1,0]]
    end

end