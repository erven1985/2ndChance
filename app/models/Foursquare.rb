require 'net/http'
require 'json'


class Foursquare < ApplicationRecord

def self.search(term)
  lat = $user_lat
  lon = $user_lon
  uri = URI("https://api.foursquare.com/v2/venues/search?query=#{URI.encode(term)}&ll=#{lat},#{lon}&limit=50&client_id=VABRDJEIIJRTEBT2RACFJFQTE5OCEI3TZ44IU0KFYAXHQOZT&client_secret=25FTBUGHO2VGUWMBC3AJL0SKTLW5D0FP3E1SZWV4I05FLOM4&v=20161118")
  p uri
  response = JSON.parse(Net::HTTP.get(uri))
  data = response["response"]["venues"].map do |r|
  { name: r["name"], id: r["id"],
    address1: r["location"]["address"], 
    address2: "#{r["location"]["city"]}, #{r["location"]["state"]}, #{r["location"]["postalCode"]}",
    distance: r["location"]["distance"],
    phone: r["contact"]["formattedPhone"]}
  # logo: "#{r["categories"][0]["icon"]["prefix"]}88#{r["categories"][0]["icon"]["suffix"]}" }
  end
end

def self.searchPhoto(id)
  
  uri = URI("https://api.foursquare.com/v2/venues/#{id}/photos?client_id=VABRDJEIIJRTEBT2RACFJFQTE5OCEI3TZ44IU0KFYAXHQOZT&client_secret=25FTBUGHO2VGUWMBC3AJL0SKTLW5D0FP3E1SZWV4I05FLOM4&v=20161118")
  p uri
  response = JSON.parse(Net::HTTP.get(uri))
  data = response["response"]["photos"]["items"].map do |r|
  { source: "#{r["prefix"]}300x300#{r["suffix"]}" }

  end
end
	
end