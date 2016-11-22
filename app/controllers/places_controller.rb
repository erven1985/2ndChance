class PlacesController < ApplicationController

	def index
	@places = Place.all
	  if params[:search]
	    @places = Place.search(params[:search]).order("created_at DESC")
	    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
			  marker.lat place.latitude
			  marker.lng place.longitude
	  	end	  
	  else
	    @places = Place.all.order('created_at DESC')
	    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
			  marker.lat place.latitude
			  marker.lng place.longitude
	  	end	  
		end
	end


	def show 
		@place = Place.find(params[:id])
		@users = @place.users
	end

end
