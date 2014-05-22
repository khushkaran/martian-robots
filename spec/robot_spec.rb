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

  it "can change orientation" do
    robot.follow_instructions("R")
    expect(robot.orientation).to eq "S"
    robot.follow_instructions("LL")
    expect(robot.orientation).to eq "N"
  end
end