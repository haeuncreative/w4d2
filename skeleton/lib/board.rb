class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    self.place_stones
    @current_player_name = @name1
    @name1_idx = 6
    @name2_idx = 13

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      if i != 6 && i != 13
        4.times {@cups[i] << :stone }
      end
    end

  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise 'Invalid starting cup'
    elsif @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)
    
    rocks = @cups[start_pos].length
    @cups[start_pos].delete(:stone)
    i = start_pos

     until rocks == 0
      i += 1
      i = 0 if i > 13

      if @current_player_name == @name1 && i != 13
        rocks -= 1
        @cups[i] << :stone
      elsif @current_player_name == @name2 && i != 6
        rocks -= 1
        @cups[i] << :stone
      else
        rocks -= 1
        @cups[i] << :stone
      end
    end
    self.render
    
    return next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    else 
      ending_cup_idx
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0...6).all? {|i| @cups[i].empty?} || (7..13).all? {|i| @cups[i].empty?}
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[13].length > @cups[6].length
      return @name2
    else
      :draw
    end
  end
end
