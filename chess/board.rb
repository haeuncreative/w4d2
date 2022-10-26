require_relative "piece"
require_relative "nullpiece"
class Board
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) { Array.new(8, @null_piece) }
        @rows.each_with_index do |row, i|
            if i < 2 || i > 5
                row.each_with_index do |ele, j|
                    @rows[i][j] = Piece.new("white", self, [i, j])
                end
            end
        end
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val
    end

    def move_piece(color, start_pos, end_pos)
        if @rows[start_pos[0]][start_pos[1]] == @null_piece
            raise "no piece at starting position"
        end
        target_piece = @rows[start_pos[0]][start_pos[1]]
        if !valid_pos?(@rows[end_pos[0]][end_pos[1]])
            raise "invalid ending point"
        end
        @rows[end_pos[0]][end_pos[1]] = target_piece
        # change null piece
        @rows[start_pos[0]][start_pos[1]] = @null_piece
    end

    def valid_pos?(pos)
        true
    end

    def add_piece(piece, pos)
        
    end

    def checkmate?(color)
        
    end

    def check(color)
        
    end

    def pieces
        
    end

    def dup
        
    end

    def move_piece!(color, start_pos, end_pos)
        
    end
end