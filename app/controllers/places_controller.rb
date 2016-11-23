class PlacesController < ApplicationController


	  def create
    @user = current_user
    @place = Place.new(place_params)
    @user.places << @place
    respond_to do |format|
      if @place.save
        format.html { redirect_to places_path, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: places_path }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

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

private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :address, :phone, :day, :month, :year, :time_from, :time_to)
    end


