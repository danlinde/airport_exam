require_relative './plane'


class Airport

	attr_reader :plane

	def initialize(capacity)
		@capacity = capacity
		@collection = []
		@closed = false
	end

	def capacity
		@capacity
	end

	def collection
		@collection
	end

	def closed
		@closed
	end

	def stock_planes 
		(@capacity-1).times { @collection << Plane.new }
	end

	def weather_is_sunny
		# true
		rand(2) == 1
	end

	def take_off
		if weather_is_sunny && if closed == false
		@plane = collection.last
		collection.delete(collection.last)
		return @plane
			end
		end

	end

	def space_available
		@capacity - @collection.length
	end

	def landing(plane)
		if weather_is_sunny && if closed == false
		@collection << plane if space_available
			end
		end
	end

	def bomb!
		puts "BOMB THREAT!!"
		@closed = true
	end

	def clear!
		@closed = false
	end
end


# airport = Airport.new(5)
# plane = Plane.new

# airport.stock_planes

# airport.bomb!
# airport. take_off

# p airport.plane

# airport.clear!

# airport. take_off

# p airport.plane
