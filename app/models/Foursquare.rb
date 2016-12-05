require 'net/http'
require 'json'


class Foursquare < ApplicationRecord

def self.search(term,coords)
  lat, lon = coords
  uri = URI("https://api.foursquare.com/v2/venues/search?query=#{URI.encode(term)}&ll=#{lat},#{lon}&limit=50&client_id=VABRDJEIIJRTEBT2RACFJFQTE5OCEI3TZ44IU0KFYAXHQOZT&client_secret=25FTBUGHO2VGUWMBC3AJL0SKTLW5D0FP3E1SZWV4I05FLOM4&v=20161118")
  p uri
  response = JSON.parse(Net::HTTP.get(uri))
  data = response["response"]["venues"].map do |r|
    next unless r['categories'].first
  { name: r["name"], id: r["id"],
    address1: r["location"]["address"], 
    address2: "#{r["location"]["city"]}, #{r["location"]["state"]}, #{r["location"]["postalCode"]}",
    distance: r["location"]["distance"],
    phone: r["contact"]["formattedPhone"],
    logo: "#{r['categories'].first['icon']['prefix']}32#{r['categories'].first['icon']['suffix']}" }
  end
end

def self.searchPhoto(id)
  
  uri = URI("https://api.foursquare.com/v2/venues/#{id}/photos?client_id=VABRDJEIIJRTEBT2RACFJFQTE5OCEI3TZ44IU0KFYAXHQOZT&client_secret=25FTBUGHO2VGUWMBC3AJL0SKTLW5D0FP3E1SZWV4I05FLOM4&v=20161118")
  p uri
  response = JSON.parse(Net::HTTP.get(uri))
  data = response["response"]["photos"]["items"].map do |r|
  { source: "#{r["prefix"]}cap800#{r["suffix"]}" }

  end
end
	
end