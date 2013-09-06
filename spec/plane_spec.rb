require './lib/plane'

describe Plane do
	let(:plane) {Plane.new}

	it 'is called charlie' do
		expect(plane.name).to eq "charlie"
	end

	it 'has a 5 person crew - a pilot, copilot and 3 stewards' do
		expect(plane.crew.length).to eq 5
	end

	it 'can request permission to take off_from' do
		air_traffic_controller = double(:air_traffic_controller, {:permission => true})
		plane.request_permission_to_take_off_from(air_traffic_controller)
		expect(plane.permission_to_take_off_from).to be_true
	end

	it 'can take off with permission' do
		airport = double(:airport)
		runway = double(:runway, {:use_for_take_off_from => :plane})
		plane.permission_to_take_off_from = true
		plane.take_off_from(runway, airport)

		expect(plane.itself).to be_true
	end

	it 'cannot take off without permission' do
		airport = double(:airport)
		runway = double(:runway, {:use_for_take_off_from => :plane})

		expect(plane.take_off_from(runway, airport)).to be_false
	end

	it 'is responsible for itself after take off' do 
	 	airport = double(:airport)
		runway = double(:runway, {:use_for_take_off_from => :plane})
	    plane.permission_to_take_off_from = true
	    plane.take_off_from(runway, airport)

	    expect(plane.itself).to be_true
	end

	it 'does not take off if weather is bad' do
	 	airport = double(:airport)
		runway = double(:runway, {:use_for_take_off_from => :plane})
		plane.permission_to_take_off_from = true

		expect(plane.take_off_from(runway, airport)).to eq nil
	end

	it 'can land if space is available' do
		airport = double :airport
		expect(airport).to receive (:landing)

		plane.land_at airport
	end

end