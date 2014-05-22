class Mars
  attr_reader :grid
  def initialize(instructions)
    instructions = parse(instructions)
    grid_size = instructions[0].slice!(0).split(" ")
    width = grid_size[0].to_i
    height = grid_size[1].to_i
    @grid = create_grid(width, height)
  end

  def create_grid(width, height)
    (0..height).map{|row|(0..width).map{|col|[]}}.reverse
  end

  def spawn_robot(robot)
    @grid.reverse[robot.position[1]][robot.position[0]] << robot
  end

  def robots
    @grid.flatten
  end

  def earth_report
    robots.reverse.map{|robot|
      "#{robot.position.join(" ")} #{robot.orientation}\n"
    }.join.chomp
  end

  def parse(instructions)
    instructions = instructions.split("\n\n")
    instructions.map!{|instruction| instruction.split("\n")}
  end
end

