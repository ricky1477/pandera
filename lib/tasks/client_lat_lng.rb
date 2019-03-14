Client.all.each do |c|
    p "Client: #{c}"
    location = Geocoder.search(c.street_address)
    if location && location[0]
      c.lat = location[0].latitude
      c.lng = location[0].longitude
      c.save!
    end
end