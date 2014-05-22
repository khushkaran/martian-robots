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
      if instruction == "F"
        x = @position[0]
        y = @position[1]
        case @orientation
        when "N"
          @position = [x,y+1]
        when "E"
          @position = [x+1,y]
        when "S"
          @position = [x,y-1]
        when "W"
          @position = [x-1,y]
        end
      else
        @orientation = new_orientation(instruction)
      end
    }
  end

  def new_orientation(instruction)
    cur_dir = DIRECTIONS.index(@orientation)
    instruction == "R" ? DIRECTIONS[cur_dir+1] : DIRECTIONS[cur_dir-1]
  end
end

