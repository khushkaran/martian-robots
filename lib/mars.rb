require_relative 'robot'

class Mars
  attr_accessor :grid

  def initialize(grid_size)
    @width = grid_size[0].to_i
    @height = grid_size[1].to_i
    @grid = create_grid(@width, @height)
  end

  def out_of_bounds?(coordinate)
    x, y = coordinate[0], coordinate[1]
    return true if x > @width || x < 0
    return true if y > @height || y < 0
    false
  end

  def create_grid(width, height)
    (0..height).map{|row|(0..width).map{|col|[]}}.reverse
  end

  def robots
    @grid.flatten
  end

  def earth_report
    robots.reverse.map{|robot|
      "#{robot.position.join(" ")} #{robot.orientation}#{" LOST" if robot.lost}\n"
    }.join.chomp
  end

  def parse(instructions)
    instructions = instructions.split("\n\n")
    instructions.map!{|instruction| instruction.split("\n")}
  end
end

