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

    private 

    def move_dirs

    end

    def grow_unblocked_moves_in_dir(dx, dy)
        grown_moves = []
        x, y = self.pos.dup
        while valid_pos? 
            x = dx + x
            y = dy + y
            if valid_pos?(x,y)
                grown_moves << [x,y]
            end
        end
        grown_moves

        valid_pos?(x,y)

        def valid?(x,y)
            if x > 10 
                return false
            elsif y > 10
                return false
            end
            true
        end

        def test(dx, dy, x, y)
            grown_moves = []
            while valid?(x,y) 
                x = dx + x
                y = dy + y
                if valid?(x,y)
                    grown_moves << [x,y]
                end
            end
            grown_moves
        end
            


    end

end