class PlacesController < ApplicationController

	def index
	@places = Place.all
	  if params[:search]
	    @places = Place.search(params[:search]).order("created_at DESC")
	  else
	    @places = Place.all.order('created_at DESC')
	  end
	end


	def show 
		@place = Place.find(params[:id])
		@users = @place.users
	end

end
