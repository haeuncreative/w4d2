module Steppable


    def moves
        output = Array.new
        move_diffs.each do |dx, dy|
            # destructing position
            # add dx and dy to it
            # quick check "is it a valid pos?"
            # if yes, pass it in
                # is the board at this position empty?
                    # yes? shovel it in
                # if no
                    # diff color?
                        # take it
            # if no, next

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
end