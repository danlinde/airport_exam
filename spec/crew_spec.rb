require './lib/crew'

describe Crew do

	it 'should be a person with a position' do
		crew = Crew.new("pilot")

		expect(crew.position).to eq "pilot"
	end

end