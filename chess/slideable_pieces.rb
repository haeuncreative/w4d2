require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end

    def move_dirs
        horizontal_dirs
    end
end

class Bishop < Piece
    include Slideable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end
    def move_dirs
        diagonal_dirs
    end
end

class Queen < Piece
    include Slideable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end
    def move_dirs
        diagonal_dirs + horizontal_dirs
    end
end