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
        raise NotYetImplemented
      else
        cur_dir = DIRECTIONS.index(@orientation)
        if instruction == "R"
          @orientation = DIRECTIONS[cur_dir+1]
        else
          @orientation = DIRECTIONS[cur_dir-1]
        end
      end
    }
  end
end

