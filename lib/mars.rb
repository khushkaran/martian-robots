require 'robot'
class Mars
  attr_reader :grid
  attr_reader :instructions
  def initialize(instructions)
    @instructions = parse(instructions)
    grid_size = @instructions[0].slice!(0).split(" ")
    @width = grid_size[0].to_i
    @height = grid_size[1].to_i
    @grid = create_grid(@width, @height)
    if @instructions.flatten.count > 0
      @instructions.each{|robot_instruction|
        robot = Robot.new(robot_instruction[0])
        spawn_robot(robot)
        robot_instruction[1].chars.each{|move|
          robot.follow_instructions(move)
          if out_of_bounds?(robot.position)
            robot.position = @prev_position
            respawn_robot(robot)
            robot.lost! and break unless previous_position.count > 1
          else
            respawn_robot(robot)
          end
        }
      }
    end
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

  def previous_position
    @grid.reverse[@prev_position[1]][@prev_position[0]]
  end

  def respawn_robot(robot)
    previous_position.pop
    spawn_robot(robot)
  end

  def spawn_robot(robot)
    @grid.reverse[robot.position[1]][robot.position[0]] << robot
    @prev_position = robot.position
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

