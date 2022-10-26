class Piece

    attr_reader :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        puts "#{@color} #{self.symbol}"
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        
    end

    def pos=(val)
        @pos = val
    end

    def symbol
        if self.is_a?(Rook)
          return :R  
        elsif self.is_a?(Bishop)
            return :B
        elsif self.is_a?(Queen)
            return :Q
        elsif self.is_a?(Knight)
            return :H
        elsif self.is_a?(King)
            return :K
        elsif self.is_a?(Pawn)
            return :P
        elsif self.is_a?(NullPiece)
            return :_
        end
    end

    def move_into_check?(end_pos)
        
    end
end