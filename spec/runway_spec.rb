require './lib/runway'

describe Runway do
	
	it 'is where the plane goes before leaving the airport' do
		runway = Runway.new
		airport = double(:airport, {:take_off => :plane})

		expect(runway.use_for_take_off_from(airport)).to be_true
	end

end
