require 'spec_helper'
require 'command_centre'

describe CommandCentre do
  let(:instructions) { "5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLL\n\n0 3 W\nLLFFFLFLFL" }
  let(:comcen) {CommandCentre.new("5 3")}
  let(:comcen2) {CommandCentre.new(instructions)}
  let(:robot1) {Robot.new("1 1 E")}
  let(:robot2) {Robot.new("3 2 N")}

  it "can be initialised with instructions" do
    expect(comcen2.instructions).to eq [["1 1 E", "RFRFRFRF"], ["3 2 N", "FRRFLLFFRRFLL"], ["0 3 W", "LLFFFLFLFL"]]
  end

  context "Adding robots to mars" do
    before {comcen.spawn_robot(robot1)}
    it "can spawn a robot" do
      expect(comcen.mars.robots.count).to eq 1
      expect(comcen.mars.grid.reverse[1][1]).to include robot1
    end

    it "can spawn a second robot" do
      comcen.spawn_robot(robot2)
      expect(comcen.mars.robots.count).to eq 2
      expect(comcen.mars.grid.reverse[2][3]).to include robot2
    end

    it "can respawn a robot" do
      comcen.spawn_robot(robot2)
      expect(comcen.mars.robots.count).to eq 2
      expect(comcen.mars.grid.reverse[2][3]).to include robot2
      robot2.follow_instructions("F")
      comcen.respawn_robot(robot2)
      expect(comcen.mars.robots.count).to eq 2
      expect(comcen.mars.grid.reverse[3][3]).to include robot2
      robot2.follow_instructions("R")
      robot2.follow_instructions("F")
      comcen.respawn_robot(robot2)
      expect(comcen.mars.robots.count).to eq 2
      expect(comcen.mars.grid.reverse[3][4]).to include robot2
    end

    it "automatically spawns robots on initialisation" do
      expect(comcen2.mars.robots.count).to eq 3
    end
  end

  context "Robots Following Instructions" do
    specify "automatically instructs robots on initialisation" do
      expect(comcen2.mars.earth_report).to eq "1 1 E\n3 3 N LOST\n2 3 S"
    end
  end
end