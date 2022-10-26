require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    include Slideable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end
    #slideable.vertical_dir
    def move_dirs
        horizontal_dirs.each do |direction|
            all_moves += grow_unblocked_moves_in_dir(*direction)
        end
    end
end

class Bishop < Piece
    include Slideable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end
    def move_dirs
        diagonal_dirs.each do |direction|
            all_moves += grow_unblocked_moves_in_dir(*direction)
        end
    end
end

class Queen < Piece
    include Slideable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end
    def move_dirs
        moves
    end
end