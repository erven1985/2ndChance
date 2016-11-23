

class SearchesController < ApplicationController
  
  def index 
  	@place = Place.new
  	@term = params[:search] || ""
  	p @term
  	@items = Foursquare.search(@term)
  	p @items
	end
  
end












