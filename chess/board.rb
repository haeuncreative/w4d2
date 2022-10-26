require_relative "piece"
require_relative "nullpiece"
require_relative "pawn"
require_relative "steppable_pieces"
require_relative "slideable_pieces"
class Board
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) { Array.new(8, @null_piece) }
        @rows.each_with_index do |row, i|
           if i == 0
            (0...8).each do |j|
                if j == 0 || j == 7
                    add_piece(Rook.new("black", self, [i, j], :R), [i, j])
                elsif j == 1 || j == 6
                    add_piece(Knight.new("black", self, [i, j], :H), [i, j])
                elsif j == 2 || j == 5
                    add_piece(Bishop.new("black", self, [i, j], :B), [i, j])
                elsif j == 3
                    add_piece(Queen.new("black", self, [i, j], :Q), [i, j])
                elsif j == 4
                    add_piece(King.new("black", self, [i, j], :K), [i, j])
                end
            end
           elsif i == 1
            (0...row.length).each do |j|
                add_piece(Pawn.new("black", self, [i, j], :P), [i, j])
            end
           elsif i == 6
            (0...row.length).each do |j|
                add_piece(Pawn.new("white", self, [i, j], :P), [i, j])
            end
           elsif i == 7
            (0...8).each do |j|
                if j == 0 || j == 7
                    add_piece(Rook.new("white", self, [i, j], :R), [i, j])
                elsif j == 1 || j == 6
                    add_piece(Knight.new("white", self, [i, j], :H), [i, j])
                elsif j == 2 || j == 5
                    add_piece(Bishop.new("white", self, [i, j], :B), [i, j])
                elsif j == 3
                    add_piece(Queen.new("white", self, [i, j], :Q), [i, j])
                elsif j == 4
                    add_piece(King.new("white", self, [i, j], :K), [i, j])
                end
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
        if !valid_pos?(end_pos)
            raise "invalid ending point"
        end
        @rows[end_pos[0]][end_pos[1]] = target_piece
        # change null piece
        @rows[start_pos[0]][start_pos[1]] = @null_piece
        target_piece.pos = end_pos
    end

    def valid_pos?(pos)
        # boundary checking
        if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
            return false
        end
        true
    end

    def add_piece(piece, pos)
        # I think this is a helper method to add pieces
        # during the initialization of the board?
        if !valid_pos?(pos)
            raise "invalid position"
        else
            self[pos] = piece
        end
    end

    def checkmate?(color)
        # when the king is unable to make any moves
        # without being in a line of fire, it is under checkmate
    end

    def check(color)
        # check all the enemy pieces 
        # grow their moves if any pos == kings position
        king_pos = find_king(color)
        @rows.each do |row|
            row.each do |el|
                if !el.empty? && el.color != color
                    return true if el.moves.any? { |pos| pos == king_pos }
                end
            end
        end
        false
    end

    def find_king(color)
        @rows.each_with_index do |row, ri|
            row.each_with_index do |el, ci|
                if el.color == color && el.symbol == :K
                    return [ri, ci]
                end
            end
        end
    end

    def pieces
        
    end

    # def dup
        
    # end

    # def move_piece!(color, start_pos, end_pos)
        
    # end
end