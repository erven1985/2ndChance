class Place < ApplicationRecord

def self.search(search)
  where("name LIKE ?", "%#{search}%") 
  # where("address LIKE ?", "%#{search}%")
end


# def users_advanced_search
# 	place = Place.find(params[:id])

# 	users = user.places.where(["name LIKE ?", place.name], ["day LIKE ?", place.day], ["month LIKE ?", place.month],  ["year LIKE ?", place.year], ["time_from LIKE ?", place.time_from], ["time_to LIKE ?", place.time_to])

# 	return users

# end	

	
	has_and_belongs_to_many :users

	geocoded_by :address
	after_validation :geocode

	# validates :name, uniqueness: true, :on => :create
	
end
