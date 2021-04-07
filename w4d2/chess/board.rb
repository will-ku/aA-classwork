require_relative "piece"
 
class Board
    # rows, cols = x,y  # your values
    # grid = Array.new(rows) { Array.new(cols) }
 
    def initialize
        # @board = Array.new(8) {Array.new(8)}
        @board = Array.new(8) { [:N] * 8 }
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
        if board[x][y] == [] #might be changed to null piece
            raise "No piece at #{start_pos}"
        end
        if !valid_move?(end_pos)
            raise "Invalid end_pos"
        end     
 
        piece = board[x][y]
        board[x][y] = [] #might be changed to null piece 
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

