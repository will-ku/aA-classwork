require "colorize"

class Piece
    attr_reader :color

    def initialize(color,board=nil, pos=nil)
        @color = color
        @board = board
        @pos = pos
    end

    def symbol
        
    end

    def inspect
        self.color
    end

    def empty?(pos)
        x, y = pos
        if @board[x][y] == :N
            return true
        end
        false
    
    end

    # def valid_move?(pos)

end