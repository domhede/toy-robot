require 'robot'
require 'spec_helper'

describe Robot do
  let(:bearing) { 'NORTH' }
  let(:x)       {0}
  let(:y)       {0}
  let(:table)   { Table.new(5,5) }
  let(:robot)   { Robot.new }

  before do 
    robot.place(bearing, x, y, table)
  end

	it "can receive a direction" do
		expect(robot.bearing).to eq "NORTH"
	end

  it "can report" do
    expect(robot.report).to eq ["NORTH", 0, 0]
  end

  it "can be placed" do
    robot.place('EAST',1,1,table)
    expect(robot.y_coord).to eq 1
    expect(robot.x_coord).to eq 1 
    expect(robot.bearing).to eq 'EAST'
  end

  it "can move" do
    robot.move
    expect(robot.y_coord).to eq 1 
  end

  context "robot is facing south" do

    let(:bearing) { 'SOUTH' }

    it "will face EAST after turning LEFT" do     
      robot.left
      expect(robot.bearing).to eq "EAST"
    end

    it "can't move south if y coordinate is 0" do
      robot.move
      expect(robot.y_coord).to eq 0
    end
  end

end