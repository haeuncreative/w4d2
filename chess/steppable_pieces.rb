class King < Piece
    include Steppable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end
end

class Knight < Piece
    include Steppable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end
end