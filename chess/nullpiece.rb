require_relative 'piece'

class NullPiece < Piece
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end

    def moves
        
    end

    def symbol
        @symbol
    end
end