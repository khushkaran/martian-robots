require_relative "mars"

class CommandCentre
  attr_reader :instructions
  attr_reader :mars

  def initialize(instructions)
    @instructions = parse(instructions)
    grid_size = @instructions[0].slice!(0).split(" ")
    @mars = Mars.new(grid_size)
    send_robots
  end

  def send_robots
    if @instructions.flatten.count > 0
      @instructions.each{|robot_instruction|
        robot = Robot.new(robot_instruction[0])
        spawn_robot(robot)
        make_move(robot, robot_instruction)
      }
    end
  end

  def make_move(robot, robot_instruction)
    robot_instruction[1].chars.each{|move|
      robot.follow_instructions(move)
      if @mars.out_of_bounds?(robot.position)
        robot.position = robot.previous_position
        respawn_robot(robot)
        robot.lost! and break unless previous_grid_area(robot).count > 1
      else
        respawn_robot(robot)
      end
    }
  end

  def spawn_robot(robot)
    @mars.grid.reverse[robot.position[1]][robot.position[0]] << robot
    robot.previous_position = robot.position
  end

  def previous_grid_area(robot)
    position = robot.previous_position
    @mars.grid.reverse[position[1]][position[0]]
  end

  def respawn_robot(robot)
    previous_grid_area(robot).pop
    spawn_robot(robot)
  end

  def parse(instructions)
    instructions = instructions.split("\n\n")
    instructions.map!{|instruction| instruction.split("\n")}
  end
end