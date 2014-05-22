require 'spec_helper'
require 'mars'
require 'robot'

describe Mars do
	let(:mars) { Mars.new("5 3") }
  let(:robot1) {Robot.new("1 1 E")}
  let(:robot2) {Robot.new("3 2 N")}
  let(:robot3) {Robot.new("0 3 W")}
  context "can be initialised with a size" do
  	it "and has a height" do
	  	expect(mars.grid.length).to eq 4
  	end

    it "and has a width" do
      expect(mars.grid[0].length).to eq 6
    end
  end

  context "Adding robots" do
    before {mars.spawn_robot(robot1)}
    it "can spawn a robot" do
      expect(mars.robots.count).to eq 1
    end

    it "can spawn a second robot" do
      mars.spawn_robot(robot2)
      expect(mars.robots.count).to eq 2
    end
  end
end