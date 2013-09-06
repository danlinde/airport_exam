require './lib/airport'

describe Airport do
	let(:airport)	{Airport.new(5)}
	before  do airport.stock_planes 
			   airport.stub(weather_is_sunny: true)
	end	

	it 'has a max capacity' do
		expect(airport.capacity).to eq 5
	end

	it 'has a collection of planes when stocked' do
		expect(airport.collection.length).to eq 4 
	end

	it 'weather is sunny' do
		expect(airport.weather_is_sunny).to be_true
	end

	it 'can allow a plane to take off' do
		airport.take_off
		expect(airport.plane.name).to eq "charlie"
	end

	it 'no longer contains a plane that takes off' do 
	   airport.take_off
	   expect(airport.collection.length).to eq 3
  	end

  	it 'will not let a plane take off in stormy weather' do
  		weather_is_sunny = false

  		expect(airport.plane).to be_nil
  	end

  	it 'can determine space available' do
  		expect(airport.space_available).to eq 1
  	end

  	it 'can allow a plane to land' do
  		plane = double(:plane, {:itself => :plane})
  		airport.landing(plane)
  		expect(airport.collection.length).to eq 5
  	end

  	it 'will not allow a plane to land when airport is full' do
  		plane = double(:plane, {:itself => :plane})
  		airport.landing(plane) 

  		expect(airport.landing(plane)).to be_false
  	end

  	it 'will not let a plane land in stormy weather' do
  		plane = double(:plane, {:itself => :plane})
  		weather_is_sunny = false

  		expect(airport.landing(plane)).to be_false
  	end

  	it 'can have a bomb scare' do 
		airport.bomb!
		expect(airport.closed).to be_true
	end

	it 'will not let a plane take off when there is a bomb scare' do
		airport.bomb!

		expect(airport.plane).to be_nil
	end

	it 'will not let a plane land when there is a bomb scare' do
		plane = double(:plane, {:itself => :plane})
		airport.bomb!

		expect(airport.landing(plane)).to be_false
	end

	it 'can have a bomb scare called off' do 
		airport.clear!

		expect(airport.closed).to be_false
	end




end