require 'spec_helper'
require 'mars'

describe Mars do
  context "can be initialised with a size" do
  	let(:mars) { Mars.new("5 3") }
  	it "and has a height" do
	  	expect(mars.grid.length).to eq 4
  	end

    it "and has a width" do
      expect(mars.grid[0].length).to eq 6
    end
  end
end