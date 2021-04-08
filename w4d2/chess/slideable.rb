module Slideable

    HORIZONTAL_DIRS = [[-1, 0], [1,0], [0, -1], [0, 1]]

    DIAGONAL_DIRS = [[-1,1],[-1, -1], [1,1], [1,-1]]

    def moves
        possible_moves = []
        move_dirs.each do |dir|
            dx, dy = dir
            possible_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        possible_moves
    end 

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def valid_pos?(x,y)
        return false if x > 7 || x < 0 || y > 7 || y < 0  
        return false if @board[[x,y]].color == self.color
        true
    end

    def move_dirs # if this is overwritten by subclass, why do we need this in the module?

    end

    def grow_unblocked_moves_in_dir(dx, dy) 
        grown_moves = []
        x, y = self.pos.dup # we need to test that this can reference the piece's pos
        flag = false
        while !flag         
            x = dx + x         
            y = dy + y
            # puts "Hello - line 41"     
            if valid_pos?(x,y)
                # puts "Hello - line 43"   
                if @board[[x,y]].color != self.color && !@board[[x,y]].is_a?(NullPiece) # if it's an enemy piece, take position & break
                    grown_moves << [x,y]
                    # break
                    flag = true
                else
                    grown_moves << [x,y]
                end
            else !valid_pos?(x,y)
                flag = true
            end
        end
        grown_moves
    end

    # checks that pos is on the board and pos is not occupied by ally
   

end