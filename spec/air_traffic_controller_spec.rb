require './lib/air_traffic_controller'

describe Air_Traffic_Controller do
	
	it 'should give permission to plane before take off' do
		air_traffic_controller = Air_Traffic_Controller.new
		expect(air_traffic_controller.permission).to be_true
	end
end