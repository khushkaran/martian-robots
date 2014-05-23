require 'spec_helper'
require 'mars'
require 'robot'

describe Mars do
  let(:instructions) { "5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLL\n\n0 3 W\nLLFFFLFLFL" }
  let(:mars) { Mars.new(instructions) }
  let(:mars2) { Mars.new("5 3") }
  let(:robot1) {Robot.new("1 1 E")}
  let(:robot2) {Robot.new("3 2 N")}
  let(:robot3) {Robot.new("0 3 W")}

  it "knows if a co-ordinate is out of bounds" do
    expect(mars2.out_of_bounds?([5, 4])).to be true
    expect(mars2.out_of_bounds?([-1, 4])).to be true
    expect(mars2.out_of_bounds?([4, 1])).to be false
  end

  context "can be initialised with some instructions" do
    it "and has a height" do
      expect(mars.grid.length).to eq 4
    end

    it "and has a width" do
      expect(mars.grid[0].length).to eq 6
    end
  end

  context "Adding robots" do
    before {mars2.spawn_robot(robot1)}
    it "can spawn a robot" do
      expect(mars2.robots.count).to eq 1
      expect(mars2.grid.reverse[1][1]).to include robot1
    end

    it "can spawn a second robot" do
      mars2.spawn_robot(robot2)
      expect(mars2.robots.count).to eq 2
      expect(mars2.grid.reverse[2][3]).to include robot2
    end

    it "can respawn a robot" do
      mars2.spawn_robot(robot2)
      expect(mars2.robots.count).to eq 2
      expect(mars2.grid.reverse[2][3]).to include robot2
      robot2.follow_instructions("F")
      mars2.respawn_robot(robot2)
      expect(mars2.robots.count).to eq 2
      expect(mars2.grid.reverse[3][3]).to include robot2
      robot2.follow_instructions("R")
      robot2.follow_instructions("F")
      mars2.respawn_robot(robot2)
      expect(mars2.robots.count).to eq 2
      expect(mars2.grid.reverse[3][4]).to include robot2
    end

    it "automatically spawns robots on initialisation" do
      expect(mars.robots.count).to eq 3
    end
  end

  context "Robots Following Instructions" do
    specify "automatically instructs robots on initialisation" do
      expect(mars.earth_report).to eq "1 1 E\n3 3 N LOST\n2 3 S"
    end
  end

  context "Producing Report" do
    it "can return the report on the robots' positions" do
      mars2.spawn_robot(robot1)
      mars2.spawn_robot(robot2)
      mars2.spawn_robot(robot3)
      expect(mars2.earth_report).to eq "1 1 E\n3 2 N\n0 3 W"
    end
  end
end