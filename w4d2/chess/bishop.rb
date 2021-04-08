require_relative "piece"
require_relative "slideable"

class Bishop
    include Slideable

    def initialize(color,board, pos)
        super
    end

    def symbol
        "B".colorize(color)
    end

    private 

    def move_dirs
        horizontal_dirs 
    end

end