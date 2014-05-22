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

  context "Moving Robot" do
    it "can change orientation" do
      robot.follow_instructions("R")
      expect(robot.orientation).to eq "S"
      robot.follow_instructions("LL")
      expect(robot.orientation).to eq "N"
    end

    it "can move forward" do
      robot.follow_instructions("F")
      expect(robot.position).to eq [2,1]
    end
  end
end