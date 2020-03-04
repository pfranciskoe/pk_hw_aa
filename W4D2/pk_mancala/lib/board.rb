# require "byebug"
class Board
  attr_accessor :cups
 
  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    @name1 = name1
    @name2 = name2
    place_stones
  end
 def place_stones
    @cups.each.with_index do |cup,idx|
      if idx != 6 && idx != 13
        4.times {cup << :stone}
      end
    end
  end
  

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 12 || start_pos == 6
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  # def make_move(start_pos, current_player_name)
  #   stones_to_be_moved = @cups[start_pos].dup
  #   @cups[start_pos] = []
  #   i = start_pos

  #   if current_player_name == @name1
  #     enemy_home = 13
  #   else
  #     enemy_home = 6
  #   end

  #  while !stones_to_be_moved.empty?
  #     if i != enemy_home
  #       @cups[i] << stones_to_be_moved.pop
  #       i += 1
  #       i = 0 if i > 13
  #     end
  #   end
  #   next_turn(i)
  # end
  def make_move(start_pos, current_player_name)
    # empties cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    # distributes stones
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      # places stones in the correct current player's cups
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      # ended on store -- get to choose where to start again
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      # ended on empty cup -- switches players' turns
      :switch
    else
      # ended on cup with stones in it -- automatically starts there
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
