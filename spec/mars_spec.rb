require 'spec_helper'
require 'mars'
require 'robot'

describe Mars do
  let(:instructions) { "5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLL\n\n0 3 W\nLLFFFLFLFL" }
  let(:mars) { Mars.new(instructions) }
  let(:mars2) { Mars.new("5 3") }
  let(:robot1) {Robot.new("1 1 E")}
  let(:robot2) {Robot.new("3 2 N")}

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
    end

    it "can spawn a second robot" do
      mars2.spawn_robot(robot2)
      expect(mars2.robots.count).to eq 2
    end

    it "automatically spawns robots on initialisation" do
      expect(mars.robots.count).to eq 3
    end
  end

  context "Producing Report" do
    it "can return the report on the robots' positions" do
      expect(mars.earth_report).to eq "1 1 E\n3 2 N\n0 3 W"
    end
  end
end