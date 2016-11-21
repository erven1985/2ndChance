class Place < ApplicationRecord

	
	has_and_belongs_to_many :users

	geocoded_by :address
	after_validation :geocode

end
