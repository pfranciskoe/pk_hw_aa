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

  def make_move(start_pos, current_player_name)
    stones_to_be_moved = @cups[start_pos].dup
    @cups[start_pos] = []
    i = start_pos
    if current_player_name == @name1
      enemy_home = 13
    else
      enemy_home = 6
    end

   while !stones_to_be_moved.empty?
      if i == 6
        @cups[i] << stones_to_be_moved.shift
        i+=1
      end
    end
  end

  def next_turn(ending_cup_idx)
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
  end

  def winner
  end
end
