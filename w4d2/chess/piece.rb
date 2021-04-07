class Piece

    def initialize(color,board, pos)
        @color = color
        @board = board
        @pos = pos

    end

    def empty?(pos)
        x, y = pos
        if @board[x][y] == :N
            return true
        end
        false
    
    end

    def valid_move?(pos)

end