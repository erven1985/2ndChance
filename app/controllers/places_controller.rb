class PlacesController < ApplicationController

	def show 
		@place = Place.find(params[:id])
		@users = @place.users
	end

end
