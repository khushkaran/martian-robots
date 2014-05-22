class Mars
  attr_reader :grid
  def initialize(grid_size)
    grid_size = grid_size.split(" ")
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
    report = ""
    robots.reverse.each_with_index{|robot, index|
      report << [robot.position.join(" "), robot.orientation].join(" ")
      report << "\n" unless index == robots.count-1
    }
    report
  end
end

