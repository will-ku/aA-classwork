require_relative "piece"
require "singleton"

class NullPiece

include Singleton

    attr_reader :symbol, :color
        
    def initialize
        @color = :grey
        @symbol = "_"
    end

    def inspect
        @symbol
    end

    def symbol
        @symbol.colorize(:grey)
    end

    def moves

    end

end