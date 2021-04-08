require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable
    
    def initialize(color,board, pos)
        super
    end

    def symbol
        "kn".colorize(color)
    end

    protected

    def moves_diff
        [[1,2], [1,-2], [2,1], [2,-1], [-1,-2], [-1,2], [-2,-1], [-2,1]]
    end

end

# knight = Knight.new(:red,"board",[0,0])
# puts knight.symbol