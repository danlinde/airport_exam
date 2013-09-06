require_relative './airport'
require_relative './crew'
require_relative './air_traffic_controller'
require_relative './runway'


class Plane

	attr_accessor :crew, :permission_to_take_off_from

	def initialize
		@name = "charlie"
		@crew = [Crew.new("pilot"), Crew.new("co-pilot"), Crew.new("steward"), Crew.new("steward"), Crew.new("steward")]
		@permission_to_take_off_from = false
	end

	def name
		@name
	end

	def itself
		@itself
	end

	def request_permission_to_take_off_from air_traffic_controller
		@permission_to_take_off_from = air_traffic_controller.permission
	end

	def take_off_from runway, airport
		@itself = runway.use_for_take_off_from(airport) if permission_to_take_off_from == true
		puts "You did not take off" if @itself.nil?
	end

	def land_at airport
		@itself = nil if airport.landing(@itself)
	end

end


