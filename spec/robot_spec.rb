require 'robot'
require 'spec_helper'

describe Robot do
	let(:bearing) { 'NORTH' }
  let(:x)       {0}
  let(:y)       {0}
  let(:robot)   { Robot.new(bearing, x, y)}

	it "can receive a direction" do
		expect(robot.bearing).to eq "NORTH"
	end

  it "can report" do
    expect(robot.report).to eq ["NORTH", 0, 0]
  end


end