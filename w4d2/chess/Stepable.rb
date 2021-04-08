module Stepable


    def moves
        possible_moves = []
        moves_diff.each do |move| # [-2, -1] = dx, dy
            x,y = self.pos.dup
            dx, dy = move
            possible_moves << move if valid_pos?(x + dx, y + dy)
        end
        possible_moves
    end

    def valid_pos?(x,y)
        return false if x > 7 || x < 0 || y > 7 || y < 0  
        return false if @board[[x,y]].color == self.color
        true
    end
    
    private

    def move_diffs # if this is overwritten by subclass, why do we need this in the module?

    end

end
