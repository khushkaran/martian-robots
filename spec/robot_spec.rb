require 'spec_helper'
require 'robot'

describe Robot do
  let(:robot) { Robot.new("1 1 E") }
	it "can be initialised with a position" do
    expect(robot.position).to eq [1,1]
  end

  it "can be initialised with an orientation" do
    expect(robot.orientation).to eq "E"
  end

  it "is not lost by default" do
    expect(robot.lost).to be false
  end

  it "can be lost" do
    robot.lost!
    expect(robot.lost).to be true
  end

  context "Moving Robot" do
    it "can turn right" do
      robot.follow_instructions("R")
      expect(robot.orientation).to eq "S"
      robot.follow_instructions("R")
      expect(robot.orientation).to eq "W"
      robot.follow_instructions("R")
      expect(robot.orientation).to eq "N"
      robot.follow_instructions("R")
      expect(robot.orientation).to eq "E"
    end

    it "can turn left" do
      robot.follow_instructions("L")
      expect(robot.orientation).to eq "N"
      robot.follow_instructions("L")
      expect(robot.orientation).to eq "W"
      robot.follow_instructions("L")
      expect(robot.orientation).to eq "S"
      robot.follow_instructions("L")
      expect(robot.orientation).to eq "E"
    end

    it "can move forward" do
      robot.follow_instructions("F")
      expect(robot.position).to eq [2,1]
    end

    it "can follow multiple instructions" do
      robot.follow_instructions("RFRFRFRF")
      expect(robot.position).to eq [1,1]
      expect(robot.orientation).to eq "E"
    end
  end
end