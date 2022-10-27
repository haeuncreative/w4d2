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

