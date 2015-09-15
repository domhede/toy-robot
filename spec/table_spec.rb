require 'table'
require 'spec_helper'

describe Table do

	let(:table) { Table.new(5,5)}

	it "has a maximum x coordinate of 5" do 
		expect(table.max_x).to eq 5
	end

	it "has a maximum y coordinate of 5" do
		expect(table.max_y).to eq 5
	end

	it "can return if coords are on table(valid)" do
		expect(table.coords_are_on_table?(2,4)).to eq true
	end

	it "can return if coords are not on table(invalid)" do
		expect(table.coords_are_on_table?(1,8)).to eq false
	end

end