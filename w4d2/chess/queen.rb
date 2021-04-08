require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable
    attr_reader :pos, :color

    def initialize(color,board, pos)
        super
    end

    def symbol
        "Q".colorize(color)
    end

    # private 

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end

end
