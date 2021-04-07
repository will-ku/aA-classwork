require_relative "piece"
require_relative "slideable"

class Bishop
    include Slideable
    def initialize

    end

    private 

    def move_dirs
        horizontal_dirs 
    end

end