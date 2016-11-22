

class SearchesController < ApplicationController
  
  def index 
  	@term = params[:search] || ""
  	p @term
  	@items = Foursquare.search(@term)
  	p @items
	end
  
end












