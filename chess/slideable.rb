module Slideable
    HORIZONTAL_DIRS = [
        [0,1],
        [1,0],
        [-1,0],
        [0,-1]
    ]

    DIAGONAL_DIRS = [
        [1,1],
        [-1,-1],
        [-1,1],
        [1,-1]
    ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def move_dirs
        raise NotImplementedError
    end

    def moves
        all_moves = Array.new
        # outputs array of all possible moves
        horizontal_dirs.each do |direction|
            all_moves += grow_unblocked_moves_in_dir(*direction)
        end
        diagonal_dirs.each do |direction|
            all_moves += grow_unblocked_moves_in_dir(*direction)
        end

        all_moves

        # iterating through move_dirs and call gubm for each dx,dy
        # concat onto final output
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        res = [self.pos]
        temp = [res[-1][0] + dx, res[-1][1] + dy]
        boundary = temp[0] > 7 || temp[0] < 0 || temp[1] > 7 || temp[1] < 0 
        friendly_fire = !temp.empty? && @board.temp.color == self.color
        true_fire = !temp.empty? && @board.temp.color != self.color
        condition = boundary || friendly_fire || true_fire
        until condition
            res << temp
        end
        res << temp if true_fire
    end

# if rook, move through rows and columns in one direction
# if bishop, move diagonally one direction ([i + x][j + x]) or ([i + x][j - x])
# if queen, gets both    

end