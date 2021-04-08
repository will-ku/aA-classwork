require_relative "piece"
require_relative "slideable"

class Rook
    include Slideable

    def initialize(color,board, pos)
        super
    end

    def symbol
        "R".colorize(color)
    end

    private 

    def move_dirs
        diagonal_dirs
    end


end