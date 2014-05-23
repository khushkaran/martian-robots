require 'spec_helper'
require 'mars'
require 'robot'

describe Mars do
  let(:mars) { Mars.new(["5", "3"]) }

  it "knows if a co-ordinate is out of bounds" do
    expect(mars.out_of_bounds?([5, 4])).to be true
    expect(mars.out_of_bounds?([-1, 4])).to be true
    expect(mars.out_of_bounds?([4, 1])).to be false
  end

  context "can be initialised with a grid size" do
    it "and has a height" do
      expect(mars.grid.length).to eq 4
    end

    it "and has a width" do
      expect(mars.grid[0].length).to eq 6
    end
  end

  context "Producing Report" do
    it "can return the report on the robots' positions" do
      mars.grid[1][1] << Robot.new("1 1 E")
      mars.grid[2][3] << Robot.new("3 2 N")
      mars.grid[3][0] << Robot.new("0 3 W")
      expect(mars.earth_report).to eq "0 3 W\n3 2 N\n1 1 E"
    end
  end
end