require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
    import Slideable
    def initialize(symbol)
        @symbol = symbol
    end
    #slideable.vertical_dir
    def make_move(dx, dy)
        moves = Array.new
        move_hash = grow_unblocked_moves_in_dir(dx, dy)
        # while true
        until self.pos == [dx, dy]
            move_hash[:horizontal].each do |pos|
                if pos.empty?
                    if pos == [dx, dy]
                        self.pos = pos
                    else
                        moves << pos
                    end
                elsif !pos.empty?
                    if @board[pos].color == self.color
                        return moves[-1]
                    else
                        return pos
                    end
                end
            end
        end
        return 
    end
end

class Bishop < Piece
    import Slideable
    def initialize(symbol)
        @symbol = symbol
    end

end

class Queen < Piece
    import Slideable
    def initialize(symbol)
        @symbol = symbol
    end
end