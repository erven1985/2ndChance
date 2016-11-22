class PlacesController < ApplicationController

	def index
	@places = Place.all
	  if params[:search]
	    @places = Place.search(params[:search]).order("created_at DESC")
	  else
	    @places = Place.all.order('created_at DESC')

    end
	  	  @hash = Gmaps4rails.build_markers(@places) do |place, marker|
			  marker.lat place.latitude
			  marker.lng place.longitude
	  	end	  
		
	end


	def show 
		@place = Place.find(params[:id])
		@users = @place.users
	end

	  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

