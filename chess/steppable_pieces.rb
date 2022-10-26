require_relative 'steppable'
require_relative 'piece'

class King < Piece
    include Steppable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end

    def move_diffs
        [[0,1],
        [1,0],
        [-1,0],
        [0,-1],
        [1,1],
        [-1,-1],
        [-1,1],
        [1,-1]]
    end
end

class Knight < Piece
    include Steppable
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end

    def move_diffs 
        [[-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]]
    end

    # def moves
    #      all_moves = Array.new
    #     # outputs array of all possible moves
    #     KNIGHT_MOVES.each do |direction|
    #         all_moves += grow_unblocked_moves_in_dir(*direction)
    #     end

    #     all_moves
    # end

    
end