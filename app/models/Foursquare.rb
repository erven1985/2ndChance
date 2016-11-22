require 'net/http'
require 'json'


class Foursquare < ApplicationRecord

def self.search(term)
  lat = 40.7 
  lon = -73.98
  uri = URI("https://api.foursquare.com/v2/venues/search?query=#{URI.encode(term)}&ll=#{lat},#{lon}&limit=50&client_id=VABRDJEIIJRTEBT2RACFJFQTE5OCEI3TZ44IU0KFYAXHQOZT&client_secret=25FTBUGHO2VGUWMBC3AJL0SKTLW5D0FP3E1SZWV4I05FLOM4&v=20161118")
  p uri
  response = JSON.parse(Net::HTTP.get(uri))
  data = response["response"]["venues"].map do |r|
  { name: r["name"], id: r["id"], address: r["location"]["formattedAddress"], 
  distance: r["location"]["distance"]} 
  end
end

def self.searchPhoto(id)
  
  uri = URI("https://api.foursquare.com/v2/venues/#{id}/photos?client_id=VABRDJEIIJRTEBT2RACFJFQTE5OCEI3TZ44IU0KFYAXHQOZT&client_secret=25FTBUGHO2VGUWMBC3AJL0SKTLW5D0FP3E1SZWV4I05FLOM4&v=20161118")
  p uri
  photos = JSON.parse(Net::HTTP.get(uri))
  all = photos["response"]["photos"].map do |r|
  { placeImg: "#{r['items']['prefix']}300x300#{r['items']['suffix']}" } 
  
  end
end
	
end