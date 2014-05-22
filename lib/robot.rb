DIRECTIONS = ["N", "E", "S", "W"]

class Robot
  attr_reader :position
  attr_reader :orientation
  def initialize(location)
    location = location.split(" ")
    @orientation = location[2]
    x = location[0].to_i
    y = location[1].to_i
    @position = [x, y]
  end

  def follow_instructions(instructions)
    instructions.chars.each{|instruction|
      instruction == "F" ? (@position = new_position) : (@orientation = new_orientation(instruction))
    }
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
    instruction == "R" ? DIRECTIONS[cur_dir+1] : DIRECTIONS[cur_dir-1]
  end
end

