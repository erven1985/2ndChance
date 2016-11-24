class Place < ApplicationRecord

def self.search(search)
  where("name LIKE ?", "%#{search}%") 
  # where("address LIKE ?", "%#{search}%")
end
	
	has_and_belongs_to_many :users

	geocoded_by :address
	after_validation :geocode

	validates :name, uniqueness: true, :on => :create

end
