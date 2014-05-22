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
end

