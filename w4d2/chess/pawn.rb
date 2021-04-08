require_relative "piece"

class Pawn

    def initialize(color,board, pos)
        super
    end

    def symbol
        "P".colorize(color)
    end

    def moves
        moves = []
        x,y = pos.dup
        possible_directions = []
        possible_directions += forward_steps + side_attacks_dir
        possible_directions.each do |dir|
            dx,dy = dir
            moves << [x+dx,y+dy] if valid_pos?(x+dx,y+dy)
        end
        moves
    end

    def valid_pos?(x,y)
        return false if x > 7 || x < 0 || y > 7 || y < 0  
        return false if @board[[x,y]].color == self.color
        true
    end

    protected
    attr_reader :color

    private

    def at_start_row?       
        return true if color == :black && pos[0] == 1
        return true if color == :white && pos[0] == 6
        false
    end

    def foward_steps
        if at_start_row? && color == :black  # comes down which means pos[0] increases
            return [[1,0],[2,0]]
        elsif !at_start_row? && color == :black
            return [[1,0]]
        elsif at_start_row? && color == :white
            return [[-1,0],[-2,0]]
        elsif !at_start_row? && color == :white
            return [[-1,0]]
        end
    end

    def side_attacks_dir
        x,y = pos
        side_attacks = []    
        if color == :black
            if @board[[x+1,y-1]].color != self.color
                side_attacks << [1,-1]
            end

            if @board[[x+1,y+1]].color != self.color
                side_attacks << [1,1]
            end

        elsif color == :white
            if @board[[x-1,y-1]].color != self.color
                side_attacks << [-1,-1]
            end

            if @board[[x-1,y+1]].color != self.color
                side_attacks << [-1,1]
            end
        end
        side_attacks
    end

    attr_reader :pos

end

        

    # forward_dir is not needed. functionality covered by forward steps
    # def forward_dir 
    #     if color == :black
    #         return [1,0]
    #     elsif color == :white
    #         return [-1,0]
    #     end
    # end