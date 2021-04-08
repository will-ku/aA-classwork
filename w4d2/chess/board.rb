require_relative "piece"
require_relative "null_piece"
require_relative "queen"

class Board
    # rows, cols = x,y  # your values
    # grid = Array.new(rows) { Array.new(cols) }
 
    def initialize
        @null = NullPiece.instance
        @board = Array.new(8) { [@null] * 8 }

        @board.each_with_index do |row, i|
            @board.each_with_index do |col, j|
                if i < 2
                    @board[i][j] = Queen.new(:black, self, [i,j])
                elsif i > 5
                    @board[i][j] = Piece.new(:white, self, [i,j])
                end
            end
        end
        
    end
        
    
    def [](pos)  
        x,y = pos
        @board[x][y]
    end

    def []=(pos, value)
        x,y = pos
        @board[x][y] = value
    end

    def move_piece(start_pos, end_pos)
        x, y = start_pos
        w, z = end_pos
        if board[x][y] == @null #might be changed to null piece
            raise "No piece at #{start_pos}"
        end
        if !valid_pos?(end_pos)
            raise "Invalid end_pos"
        end     
 
        piece = board[x][y]
        board[x][y] = @null #might be changed to null piece 
        board[w][z] = piece
   end
 
   def valid_pos?(end_pos)
        x, y = end_pos
 
        if x > 0 and x < 7 and y > 0 and y < 7
            return true
        end
        false
   end
 
     
    attr_accessor :board
 
end

