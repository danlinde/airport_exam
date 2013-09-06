require_relative './airport'


class Runway

	attr_reader :plane

	def initialize
		@plane = nil
	end

	def use_for_take_off_from airport
		@plane = airport.take_off 
	end

end

# runway = Runway.new
# airport = Airport.new(5)



# airport.stock_planes

# p airport.collection

# runway.use_for_take_off_from(airport)


# p runway.plane