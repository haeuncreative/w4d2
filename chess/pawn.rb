require_relative 'piece'# :)

class Pawn < Piece
    def initialize(color, board, pos, symbol)
        super(color, board, pos)
        @symbol = symbol
    end

    def move_diffs_black
        [[0,1], # straight down
        [1,1],  # down right
        [-1,1]] # down left
    end

    def move_diffs_white
        [[0,-1], # straight up
        [-1,-1], # up left
        [1,-1]]  # up right
    end

    def moves
        res = Array.new
        if color == "white"
            move_diffs = move_diffs_white
        else
            move_diffs = move_diffs_black
        end
        move_diffs.each do |(dx, dy)|
            temp = [pos[0] + dx, pos[1] + dy]
            if board.valid_pos?(temp)
                # if dx == 0 & pos is empty => move
                # if empty & forwards => go // done
                if board[temp].empty? && dx == 0
                    res << temp
                # if empty & diagonal => invalid
                elsif board[temp].color != self.color && dx != 0
                        res << temp
                else
                    next
                end
            end
        end
        res
    end
end