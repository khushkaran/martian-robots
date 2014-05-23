DIRECTIONS = ["N", "E", "S", "W"]

class Robot
  attr_accessor :position
  attr_reader :orientation
  attr_accessor :lost
  def initialize(location)
    location = location.split(" ")
    @orientation = location[2]
    @lost = false
    x = location[0].to_i
    y = location[1].to_i
    @position = [x, y]
  end

  def follow_instructions(instruction)
    instruction == "F" ? (@position = new_position) : (@orientation = new_orientation(instruction))
  end

  def new_position
    x, y = @position[0], @position[1]
    return [x,y+1] if @orientation == "N"
    return [x+1,y] if @orientation == "E"
    return [x,y-1] if @orientation == "S"
    return [x-1,y] if @orientation == "W"
  end

  def new_orientation(instruction)
    cur_dir = DIRECTIONS.index(@orientation)
    new_dir = instruction == "R" ? cur_dir+1 : cur_dir-1
    new_dir = 0 if new_dir > DIRECTIONS.count-1
    DIRECTIONS[new_dir]
  end

  def lost!
    @lost = true
  end
end

