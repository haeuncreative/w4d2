module Steppable
    def moves
        res = Array.new
        move_diffs.each do |(dx, dy)|
            # destructing position
            # add dx and dy to it
            temp = [pos[0] + dx, pos[1] + dy]
            # quick check "is it a valid pos?"
            if board.valid_pos?(temp)
                # is the board at this position empty?
                    # yes? shovel it in
                if board[temp].empty?
                    res << temp
                    # if no
                else
                    # diff color?
                    if board[temp].color != self.color
                        # take it
                        res << temp
                    # if no, next
                    else
                        next
                    end
                end
            end
        end
        res
    end

    def move_diffs
        raise NotImplementedError
    end
end


# def moves
#     all_moves = Array.new
#     # outputs array of all possible moves
#     horizontal_dirs.each do |direction|
#         all_moves += grow_unblocked_moves_in_dir(*direction)
#     end
#     diagonal_dirs.each do |direction|
#         all_moves += grow_unblocked_moves_in_dir(*direction)
#     end

#     all_moves
# end

# def grow_unblocked_moves_in_dir(dx, dy)
#     res = [self.pos]
#     temp = [res[-1][0] + dx, res[-1][1] + dy]
#     boundary = temp[0] > 7 || temp[0] < 0 || temp[1] > 7 || temp[1] < 0 
#     friendly_fire = !@board[temp].empty? && @board[temp].color == self.color
#     true_fire = !@board[temp].empty? && @board[temp].color != self.color
#     condition = boundary || friendly_fire || true_fire
#     unless condition
#         res << temp
#     end
#     res << temp if true_fire
# end