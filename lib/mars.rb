require 'robot'
class Mars
  attr_reader :grid
  attr_reader :instructions
  def initialize(instructions)
    @instructions = parse(instructions)
    grid_size = @instructions[0].slice!(0).split(" ")
    width = grid_size[0].to_i
    height = grid_size[1].to_i
    @grid = create_grid(width, height)
    if @instructions.flatten.count > 0
      @instructions.each{|robot_instruction|
        robot = Robot.new(robot_instruction[0])
        spawn_robot(robot)
        robot_instruction[1].chars.each{|move|
          robot.follow_instructions(move)
          x = robot.position[0]
          y = robot.position[1]
          puts "#{x} > #{width} || #{y} > #{height} || #{robot.position}"
          robot.lost! and break if x > width || y > height
        }
        p "#{robot.lost}>>>>>>>>>>>>>>>>>>>>>"
      }
    end
    p @grid
  end

  def create_grid(width, height)
    (0..height).map{|row|(0..width).map{|col|[]}}.reverse
  end

  def respawn_robot(robot)
    @grid.flatten.reject{|cur_robot| cur_robot == robot}
    spawn_robot(robot)
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

